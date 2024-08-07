package br.com.alura.screenmatch.principal;

import br.com.alura.screenmatch.model.DadosEpisodio;
import br.com.alura.screenmatch.model.DadosSerie;
import br.com.alura.screenmatch.model.DadosTemporada;
import br.com.alura.screenmatch.model.Episodio;
import br.com.alura.screenmatch.service.ConsumoApiService;
import br.com.alura.screenmatch.service.ConverteDadosService;

import java.util.*;
import java.util.stream.Collectors;

public class Principal {

    private final Scanner scanner = new Scanner(System.in);
    private final String BASEURL = "https://www.omdbapi.com/";
    private final String APIKEY = "&apikey=db719a40";
        private ConsumoApiService consumoApiService = new ConsumoApiService();
    private ConverteDadosService conversor = new ConverteDadosService();

    public void exibeMenu() {
        System.out.println("Digite o nome da série para busca: ");
        var nomeSerie = scanner.nextLine();
        var json = consumoApiService.obterDados(BASEURL + "?t=" + nomeSerie.replace(" ", "+") + APIKEY);
        DadosSerie dados = conversor.obterDados(json, DadosSerie.class);

        List<DadosTemporada> dadosTemporadas = new ArrayList<>();

        for(int i  = 1; i <= dados.totalTemporadas(); i++) {
			json = consumoApiService.obterDados(BASEURL + "?t=" +
                    nomeSerie.replace(" ", "+") + "&season=" + i + APIKEY);
			dadosTemporadas.add(conversor.obterDados(json, DadosTemporada.class));
		}

        // dadosTemporadas.forEach(t -> t.episodios().forEach(e -> System.out.println("Temporada: " + t.numero() + " | Episódio: " + e.titulo())));

        List<DadosEpisodio> todosEpisodios = dadosTemporadas.stream()
                .flatMap(t -> t.episodios().stream())
                .collect(Collectors.toList());

//        System.out.println("Top 10 episódios");
//        todosEpisodios.stream()
//                .peek(e -> System.out.println("Primeiro filtro (N/A): " + e))
//                .filter(e -> !e.avaliacao().equalsIgnoreCase("N/A"))
//                .sorted(Comparator.comparing(DadosEpisodio::avaliacao).reversed())
//                .peek(e -> System.out.println("Ordenação: " + e))
//                .limit(10)
//                .map(e -> e.titulo().toUpperCase())
//                .peek(e -> System.out.println("Mapeamento: " + e))
//                .forEach(System.out::println);

        List<Episodio> episodios = dadosTemporadas.stream()
                .flatMap(t -> t.episodios().stream()
                        .map(d -> new Episodio(t.numero(), d)))
                .collect(Collectors.toList());

         episodios.forEach(System.out::println);

//        System.out.println("Informe o nome do episódio desejado:");
//         var trechoTitulo = scanner.nextLine();
//
//         Optional<Episodio> episodioFiltrado = episodios.stream()
//                 .filter(e -> e.getTitulo().toUpperCase().contains(trechoTitulo.toUpperCase()))
//                 .findFirst();
//
//         if(episodioFiltrado.isPresent()) {
//             System.out.println("Episódio encontrado!");
//             System.out.println("Temporada " + episodioFiltrado.get().getTemporada());
//         } else {
//             System.out.println("Episódio não encontrado!");
//         }
//
//        System.out.println("A partir de qual ano você deseja ver os epiosódios?");
//        var ano = scanner.nextInt();
//        LocalDate dataBusca = LocalDate.of(ano, 1, 1);
//        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");

//        episodios.stream()
//                .filter(e -> e.getDataLancamento() != null && e.getDataLancamento().isAfter(dataBusca))
//                .forEach(e -> System.out.println(
//                        "Temporada: " + e.getTemporada() +
//                                " | Episódio: " + e.getTitulo() +
//                        " | Data de Lançamento: " + e.getDataLancamento().format(dtf)));


        Map<Integer, Double> avaliacoes = episodios.stream()
                .filter(e -> e.getAvaliacao() > 0.0)
                .collect(Collectors.groupingBy(Episodio::getTemporada,
                        Collectors.averagingDouble(Episodio::getAvaliacao)));

        System.out.println(avaliacoes);


        DoubleSummaryStatistics est = episodios.stream()
                .filter(e -> e.getAvaliacao() > 0)
                .collect(Collectors.summarizingDouble(Episodio::getAvaliacao));

        System.out.println("Média: " + est.getAverage());
        System.out.println("Menor nota: " + est.getMin());
        System.out.println("Maior nota: " + est.getMax());
    }
}
