import {MikroORM, wrap} from "@mikro-orm/core";
import {Recipe} from "./entities/recipe.entity";

async function main(): Promise<void>{
    const orm = await MikroORM.init();
    const em = orm.em;

    const finalRecipeFind = wrap((await em.find(Recipe, {}))[0]).toObject()

    console.log("Actual:")
    console.dir(finalRecipeFind, {depth: null})

    console.log("Expected:")
    console.dir({
        id: 1,
        name: 'Roast Beef with Onions',
        steps: [
            { id: 13, text: 'New1', recipe: 1 },
            { id: 14, text: 'New2', recipe: 1 }
        ]
    }, {depth: null})

    await orm.close()
}

main();

