package com.danim.repository;

import com.danim.dto.UserInfoRes;
import com.danim.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User getByNickname(String nickname);

    User getByClientId(String clientId);

    @Query(value = "select u.userUid, u.nickname, u.profileImageUrl from User u where u.userUid = :userUid")
    UserInfoRes getNicknameAndProfileImage(@Param("userUid") Long userUid);

    @Query(value = "select u.userUid, u.nickname, u.profileImageUrl from User u where u.nickname like %:search% order by u.nickname")
    List<UserInfoRes> searchUserByNickname(@Param("search") String search);
}
