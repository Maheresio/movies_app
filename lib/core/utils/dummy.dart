import '../../movies/domain/entities/genres.dart';

import '../../movies/domain/entities/movies_details.dart';
import '../../movies/domain/entities/recommendation.dart';

MoviesDetails movieDetailDummy = MoviesDetails(
  id: 438148,
  backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
  generes: [
    Genres(name: 'Family', id: 10751),
  ],
  overview:
      "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
  releaseDate: "2022-06-29",
  runtime: 87,
  title: "Minions: The Rise of Gru",
  voteAverage: 7.8,
);

List<Recommendation> recommendationDummy = [
  Recommendation(backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  Recommendation(backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  Recommendation(backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  Recommendation(backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  Recommendation(backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  Recommendation(backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  Recommendation(backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  Recommendation(backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
];
