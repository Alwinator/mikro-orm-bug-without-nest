import {Cascade, Entity, ManyToOne, PrimaryKey, Property} from '@mikro-orm/core'
import {Recipe} from "./recipe.entity";
import {Ingredient} from "./ingredient.entity";

@Entity()
export class RecipeIngredient{
  @PrimaryKey()
  id: number

  @Property()
  quantity: number

  @ManyToOne(() => Ingredient, {eager: true, cascade: [Cascade.MERGE]})
  ingredient: Ingredient

  @ManyToOne(() => Recipe)
  recipe: Recipe
}
