import {Cascade, Collection, Entity, OneToMany, PrimaryKey, Property} from '@mikro-orm/core'
import {RecipeStep} from "./recipe-step.entity";


@Entity()
export class Recipe{
  @PrimaryKey()
  id: number

  @Property()
  name: string

  @OneToMany(() => RecipeStep, step => step.recipe, {cascade: [Cascade.ALL], eager: true, orphanRemoval: true})
  steps: Collection<RecipeStep> = new Collection<RecipeStep>(this)
}
