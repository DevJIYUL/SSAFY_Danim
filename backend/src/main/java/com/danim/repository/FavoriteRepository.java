package com.danim.repository;

import com.danim.entity.Favorite;
import com.danim.entity.Post;
import com.danim.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FavoriteRepository extends JpaRepository<Favorite, Long> {
    // 해당 포스트에 해당 유저가 좋아요 눌렀는지 여부 검색
    Favorite findByPostIdAndUserUid(Post post, User user);

    // 포스트에 눌린 좋아요 수 검색
    Long countByPostId(Post post);

    // 해당 유저가 좋아요 누른 포스트 검색
    Optional<List<Favorite>> findAllByUserUid(User user);
}