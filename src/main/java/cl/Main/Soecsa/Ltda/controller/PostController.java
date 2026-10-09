package cl.Main.Soecsa.Ltda.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cl.Main.Soecsa.Ltda.entity.Post;
import cl.Main.Soecsa.Ltda.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {

    private final PostService postService;

    public PostController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/noticias")
    public String showNewsPosts(Model model) {
        List<Post> posts = postService.getPost();
        model.addAttribute("posts", posts);
        return "news";
    }

    @GetMapping("/noticia/{id}")
    public String showPost(@PathVariable Long id, Model model) {
        model.addAttribute("post", findPost(id));
        return "post-details";
    }

    @GetMapping("/nuevo")
    public String showCreateForm(Model model) {
        model.addAttribute("post", new Post());
        model.addAttribute("formAction", "/post");
        return "post-form";
    }

    @PostMapping
    public String createPost(Post post, RedirectAttributes redirectAttributes) {
        postService.createPost(post);
        redirectAttributes.addFlashAttribute("mensaje", "La noticia se publicó correctamente.");
        return "redirect:/post/noticias";
    }

    @GetMapping("/{id}/editar")
    public String showEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("post", findPost(id));
        model.addAttribute("formAction", "/post/" + id);
        return "post-form";
    }

    @PostMapping("/{id}")
    public String updatePost(@PathVariable Long id, Post post, RedirectAttributes redirectAttributes) {
        findPost(id);
        post.setId(id);
        postService.createPost(post);
        redirectAttributes.addFlashAttribute("mensaje", "La noticia se actualizó correctamente.");
        return "redirect:/post/noticias";
    }

    @PostMapping("/{id}/eliminar")
    public String deletePost(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        findPost(id);
        postService.deletePost(id);
        redirectAttributes.addFlashAttribute("mensaje", "La noticia se eliminó correctamente.");
        return "redirect:/post/noticias";
    }

    private Post findPost(Long id) {
        Post post = postService.getPost(id);
        if (post == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No existe la noticia solicitada.");
        }
        return post;
    }
}
