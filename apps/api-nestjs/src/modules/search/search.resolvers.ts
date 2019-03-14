import { Args, Query, Resolver } from '@nestjs/graphql'
import { SearchService } from '@app/modules/search/search.service'

@Resolver('Search')
export class SearchResolvers {
  constructor(private readonly searchService: SearchService) {}

  @Query()
  async search(@Args('hash') hash: string) {
    return this.searchService.search(hash)
  }
}
