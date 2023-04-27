package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Ranking;

import java.util.List;

public interface RankingRepository {

    public List<Ranking> getAllRanking();

    public Ranking createRanking(Ranking ranking);

    public Ranking updateRanking(Ranking ranking);

    public void deleteRankingById(Integer id);
}
