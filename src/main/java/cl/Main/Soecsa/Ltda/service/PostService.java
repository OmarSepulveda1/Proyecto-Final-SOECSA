package cl.Main.Soecsa.Ltda.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import cl.Main.Soecsa.Ltda.entity.Post;
import cl.Main.Soecsa.Ltda.repository.IPostRepository;

@Service
public class PostService {

    private final IPostRepository postRepository;

    public PostService(IPostRepository postRepository) {
        this.postRepository = postRepository;
    }

    public List<Post> getPost() {
        return postRepository.findAll();
    }

    public Optional<Post> findPost(Long id) {
        return postRepository.findById(id);
    }

    public Post getPost(Long id) {
        return findPost(id).orElse(null);
    }

    public Post createPost(Post post) {
        return postRepository.save(post);
    }

    public void deletePost(Long id) {
        postRepository.deleteById(id);
    }
}
