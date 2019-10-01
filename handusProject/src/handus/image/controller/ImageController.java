package handus.image.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import handus.image.service.ImageService;

@Controller
@RequestMapping("/image")
public class ImageController {
	
	@Autowired
	private ImageService imageService;
	
	@RequestMapping("/{pk}")
	@ResponseBody
	public byte[] showImage(@PathVariable("pk") int hi_pk) throws IOException {
			
		return imageService.getImageData(hi_pk);
	}
	
}
