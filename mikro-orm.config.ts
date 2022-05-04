import { TsMorphMetadataProvider } from '@mikro-orm/reflection'
import { Options } from '@mikro-orm/core'
import {PostgreSqlDriver} from "@mikro-orm/postgresql";

const config = {
  entities: [__dirname + '/**/*.entity{.ts,.js}'],
  dbName: 'mikro-orm-bug',
  type: 'postgresql',
  user: 'mikro-orm-bug',
  host: 'localhost',
  port: 5432,
  debug: true,
  password: 'C47n47z8z!',
  allowGlobalContext: true,
  autoLoadEntities: true,
  forceUndefined: true,
  forceUtcTimezone: true,
  validate: true,
  validateRequired: true,
  strict: true,
  schemaGenerator: {
    disableForeignKeys: false
  },
  migrations: {
    disableForeignKeys: false
  },
  metadataProvider: TsMorphMetadataProvider,
} as Options<PostgreSqlDriver>

export default config