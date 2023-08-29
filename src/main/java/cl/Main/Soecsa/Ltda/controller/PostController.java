package cl.Main.Soecsa.Ltda.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cl.Main.Soecsa.Ltda.entity.Post;
import cl.Main.Soecsa.Ltda.service.PostService;

@Controller
@RequestMapping("/Publicar")
public class PostController {
	
	private final PostService postService;
	
	public PostController(PostService postService) {
		this.postService = postService;
	}
	
	@GetMapping("/noticias")
	public String showNewsPosts(Model model) {
		List<Post> post = postService.getPost();
		model.addAttribute("posts", post);
		return "post/news";
	}
	
	@GetMapping("/detalles/{id}")
    public String show(@PathVariable Long id, Model model) {
        Post post = postService.getPost(id);
        model.addAttribute("post", post);
        return "students/detalles";
	}
	
	@GetMapping("/crear")
    public String mostrarFormularioNoticias(Model model) {
        model.addAttribute("post", new Post());
        return "post/formulario-crear"; // Nombre del archivo JSP para el formulario de creación
    }
	
	@PostMapping("/guardar")
    public String guardarPost(Post post) {
        postService.createPost(post);
        return "redirect:/post"; // Redireccionar a la lista después de guardar
    }
	
	@RequestMapping(value = "/eliminarPublicación")
    public ModelAndView mostrarFormularioNoticias(ModelMap model,
            @RequestParam("idRescatado") Long id) {
		postService.borrarUsuario(id);
        model.addAttribute("mensaje", "Noticia eliminado con éxito");
        return new ModelAndView("redirect:/eliminarPost", model);
    }
	

}
