package cl.Main.Soecsa.Ltda.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.Main.Soecsa.Ltda.entity.Post;
import cl.Main.Soecsa.Ltda.repository.IPostRepository;

@Service
public class PostService {

	public PostService() {
		super();

	}

	@Autowired
	private IPostRepository postRepo;

	public ArrayList<Post> getPost() {
		return (ArrayList<Post>) postRepo.findAll();
	}

	public Post getPost(Long id) {
		return postRepo.findById(id).get();
	}

	public void createPost(Post post) {
		postRepo.save(post);
	}

	public void update(Post post) {
		postRepo.save(post);
	}

	public void borrarUsuario(Long id) {
		postRepo.delete(postRepo.getOne(id));
	}
}
