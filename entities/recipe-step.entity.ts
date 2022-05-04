import {Entity, ManyToOne, PrimaryKey, Property} from '@mikro-orm/core'
import { Recipe } from './recipe.entity'

@Entity()
export class RecipeStep {
  @PrimaryKey()
  id: number

  @Property()
  text: string

  @ManyToOne(() => Recipe)
  recipe: Recipe
}
