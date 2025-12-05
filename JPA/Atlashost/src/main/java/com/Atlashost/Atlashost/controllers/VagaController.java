package com.Atlashost.Atlashost.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Atlashost.Atlashost.repository.CandidatoRepository;
import com.Atlashost.Atlashost.repository.VagaRepository;
import com.Atlashost.Atlashost.models.Candidato;
import com.Atlashost.Atlashost.models.Vaga;

@Controller
public class VagaController {

    @Autowired
    private VagaRepository vr;

    @Autowired
    private CandidatoRepository cr;

    // CADASTRAR VAGA – GET
    @RequestMapping(value = "/cadastrarVaga", method = RequestMethod.GET)
    public String form() {
        return "vaga/formVaga";
    }

    // CADASTRAR VAGA – POST
    @RequestMapping(value = "/cadastrarVaga", method = RequestMethod.POST)
    public String form(@Valid Vaga vaga, BindingResult result, RedirectAttributes attributes) {

        if (result.hasErrors()) {
            attributes.addFlashAttribute("mensagem", "Verifique os campos...");
            return "redirect:/cadastrarVaga";
        }

        vr.save(vaga);
        attributes.addFlashAttribute("mensagem", "Vaga cadastrada com sucesso!");
        return "redirect:/cadastrarVaga";
    }

}
