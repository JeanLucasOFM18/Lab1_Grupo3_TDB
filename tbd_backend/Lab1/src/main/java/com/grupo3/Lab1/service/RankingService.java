package com.grupo3.Lab1.service;

import com.grupo3.Lab1.entity.Ranking;
import com.grupo3.Lab1.repository.RankingRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class RankingService {

    private final RankingRepository rankingRepository;

    public RankingService(RankingRepository repository) {
        this.rankingRepository = repository;
    }

    @GetMapping("/ranking")
    public List<Ranking> getAllRanking(){
        List<Ranking> list = rankingRepository.getAllRanking();
        return list;
    }

    @PostMapping("/Ranking")
    public String createRanking(@RequestBody Ranking ranking){
        Ranking result = rankingRepository.createRanking(ranking);
        return "Se ha creado el elemento con id: " + result.getId();
    }

    @PutMapping("/Ranking/update")
    public String updateRanking(@RequestBody Ranking ranking){
        Ranking result = rankingRepository.updateRanking(ranking);
        return "Se ha actualizado el elemento con id: " + result.getId();
    }

    @DeleteMapping("/Ranking/delete/{id}")
    public String deleteRanking(@PathVariable Integer id){
        rankingRepository.deleteRankingById(id);
        return "Se ha eliminado el elemento con id: " + id;
    }
}
