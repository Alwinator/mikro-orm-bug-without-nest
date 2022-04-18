import {EntityData, MikroORM, wrap} from "@mikro-orm/core";
import {Recipe} from "./entities/recipe.entity";
import {Ingredient} from "./entities/ingredient.entity";

async function main(): Promise<void>{
    const orm = await MikroORM.init();
    const em = orm.em;

    // Delete All
    const oldRecipes = await em.find(Recipe, {});
    for (let recipe of oldRecipes) {
        await em.remove(recipe)
    }
    const oldIngredients = await em.find(Ingredient, {})
    for (let ingredient of oldIngredients) {
        await em.remove(ingredient)
    }
    await em.flush()

    // Define data
    let ingredients: EntityData<Ingredient>[] = [
        {
            id: 1,
            name: 'Tomato',
        },
        {
            id: 2,
            name: 'Cheese',
        },
        {
            id: 3,
            name: 'Basil',
        },
    ]
    const recipe: EntityData<Recipe> = {
        id: 1,
        name: 'Pizza',
        ingredients: [
            {
                id: 1,
                quantity: 4,
                ingredient: ingredients[0],
            }
        ],
    }
    const updatedRecipe: EntityData<Recipe> = {
        id: 1,
        name: 'Pizza',
        ingredients: [
            {
                id: 1,
                quantity: 2,
                ingredient: ingredients[1],
            }
        ],
    }

    // Insert data
    const recipeEntity = em.create(Recipe, recipe)
    em.persist(recipeEntity)

    for (const ingredient of ingredients) {
        const ingredientEntity = em.create(Ingredient, ingredient)
        em.persist(ingredientEntity)
    }
    await em.flush()

    // Update recipe
    const recipeToUpdate = await em.findOne(Recipe, updatedRecipe.id)
    wrap(recipeToUpdate).assign(updatedRecipe, { mergeObjects: true })
    await em.flush()

    // Evaluate
    const finalRecipe = wrap(await em.findOne(Recipe, {id: 1})).toObject()

    delete finalRecipe.ingredients[0].recipe
    delete finalRecipe.ingredients[0].ingredient.recipeIngredients

    console.log("Actual:")
    console.dir(finalRecipe, {depth: null})

    console.log("Expected:")
    console.dir(updatedRecipe, {depth: null})
}

main();

