TITLE: Create Public Profiles Table with RLS and Auth Users Reference
DESCRIPTION: This SQL snippet demonstrates how to create a `public.profiles` table that references the `auth.users` table with `on delete cascade` and enables Row Level Security (RLS). This allows secure access to user data via the API while maintaining data integrity with Supabase's authentication system.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/managing-user-data.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
create table public.profiles (
  id uuid not null references auth.users on delete cascade,
  first_name text,
  last_name text,

  primary key (id)
);

alter table public.profiles enable row level security;
```

---

TITLE: Implementing User Authentication Component with Supabase in React Native (TSX)
DESCRIPTION: This React Native component (`Auth.tsx`) provides a user interface for email and password-based sign-in and sign-up using Supabase. It manages input states, handles loading indicators, and integrates Supabase authentication methods. Additionally, it sets up an `AppState` listener to ensure continuous session refreshing when the app is active.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-expo-react-native.mdx#_snippet_4

LANGUAGE: tsx
CODE:

```
import React, { useState } from 'react'
import { Alert, StyleSheet, View, AppState } from 'react-native'
import { supabase } from '../lib/supabase'
import { Button, Input } from '@rneui/themed'

// Tells Supabase Auth to continuously refresh the session automatically if
// the app is in the foreground. When this is added, you will continue to receive
// `onAuthStateChange` events with the `TOKEN_REFRESHED` or `SIGNED_OUT` event
// if the user's session is terminated. This should only be registered once.
AppState.addEventListener('change', (state) => {
  if (state === 'active') {
    supabase.auth.startAutoRefresh()
  } else {
    supabase.auth.stopAutoRefresh()
  }
})

export default function Auth() {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [loading, setLoading] = useState(false)

  async function signInWithEmail() {
    setLoading(true)
    const { error } = await supabase.auth.signInWithPassword({
      email: email,
      password: password,
    })

    if (error) Alert.alert(error.message)
    setLoading(false)
  }

  async function signUpWithEmail() {
    setLoading(true)
    const {
      data: { session },
      error,
    } = await supabase.auth.signUp({
      email: email,
      password: password,
    })

    if (error) Alert.alert(error.message)
    if (!session) Alert.alert('Please check your inbox for email verification!')
    setLoading(false)
  }

  return (
    <View style={styles.container}>
      <View style={[styles.verticallySpaced, styles.mt20]}>
        <Input
          label="Email"
          leftIcon={{ type: 'font-awesome', name: 'envelope' }}
          onChangeText={(text) => setEmail(text)}
          value={email}
          placeholder="email@address.com"
          autoCapitalize={'none'}
        />
      </View>
      <View style={styles.verticallySpaced}>
        <Input
          label="Password"
          leftIcon={{ type: 'font-awesome', name: 'lock' }}
          onChangeText={(text) => setPassword(text)}
          value={password}
          secureTextEntry={true}
          placeholder="Password"
          autoCapitalize={'none'}
        />
      </View>
      <View style={[styles.verticallySpaced, styles.mt20]}>
        <Button title="Sign in" disabled={loading} onPress={() => signInWithEmail()} />
      </View>
      <View style={styles.verticallySpaced}>
        <Button title="Sign up" disabled={loading} onPress={() => signUpWithEmail()} />
      </View>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    marginTop: 40,
    padding: 12,
  },
  verticallySpaced: {
    paddingTop: 4,
    paddingBottom: 4,
    alignSelf: 'stretch',
  },
  mt20: {
    marginTop: 20,
  },
})
```

---

TITLE: Initializing Supabase Client in TypeScript
DESCRIPTION: This TypeScript code initializes the Supabase client using the createClient function from @supabase/supabase-js. It retrieves the Supabase URL and anonymous key from environment variables, establishing the connection to the Supabase project.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-09-23-local-first-expo-legend-state.mdx#_snippet_3

LANGUAGE: typescript
CODE:

```
import { createClient } from '@supabase/supabase-js'

const supabase = createClient(
  process.env.EXPO_PUBLIC_SUPABASE_URL,
  process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY
)
```

---

TITLE: Creating User Roles and Permissions Tables in SQL
DESCRIPTION: This SQL script defines custom types for application roles (`app_role`) and permissions (`app_permission`), then creates two tables: `user_roles` to assign roles to users, and `role_permissions` to map specific permissions to each role. This setup forms the foundation for implementing role-based access control within the application.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/custom-claims-and-role-based-access-control-rbac.mdx#_snippet_1

LANGUAGE: sql
CODE:

```
-- Custom types
create type public.app_permission as enum ('channels.delete', 'messages.delete');
create type public.app_role as enum ('admin', 'moderator');

-- USER ROLES
create table public.user_roles (
  id        bigint generated by default as identity primary key,
  user_id   uuid references auth.users on delete cascade not null,
  role      app_role not null,
  unique (user_id, role)
);
comment on table public.user_roles is 'Application roles for each user.';

-- ROLE PERMISSIONS
create table public.role_permissions (
  id           bigint generated by default as identity primary key,
  role         app_role not null,
  permission   app_permission not null,
  unique (role, permission)
);
comment on table public.role_permissions is 'Application permissions for each role.';
```

---

TITLE: Creating Documents Table with Vector Column in Postgres
DESCRIPTION: This SQL statement creates a new table named `documents` to store textual content and its corresponding embedding vectors. The `embedding` column uses the `vector(512)` data type, where 512 represents the dimensionality of the embedding, which should match the output of your chosen embedding model.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/semantic-search.mdx#_snippet_1

LANGUAGE: SQL
CODE:

```
create table documents (
  id bigint primary key generated always as identity,
  content text,
  embedding vector(512)
);
```

---

TITLE: Fetching Data with Supabase in Next.js Server Components
DESCRIPTION: This example illustrates how to fetch data directly from Supabase within a Next.js Server Component. By using await supabase.from('...').select(), data can be retrieved on the server before the component is rendered, simplifying data fetching logic and improving initial page load performance.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-11-01-supabase-is-now-compatible-with-nextjs-14.mdx#_snippet_1

LANGUAGE: tsx
CODE:

```
export default async function Page() {
  const { data } = await supabase.from('...').select()
  return ...
}
```

---

TITLE: Fetching Single Post with Static Revalidation (Next.js, Supabase)
DESCRIPTION: This Next.js Server Component handles fetching a single post by ID from Supabase. It uses `generateStaticParams` to pre-render pages for known IDs and `revalidate = 60` to ensure the data is refreshed periodically, similar to `getStaticPaths` and `getStaticProps` with revalidation.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-11-17-fetching-and-caching-supabase-data-in-next-js-server-components.mdx#_snippet_13

LANGUAGE: tsx
CODE:

```
import supabase from '../../../utils/supabase'
import { notFound } from 'next/navigation'

export const revalidate = 60

export async function generateStaticParams() {
  const { data: posts } = await supabase.from('posts').select('id')

  return posts?.map(({ id }) => ({
    id,
  }))
}

export default async function Post({ params: { id } }: { params: { id: string } }) {
  const { data: post } = await supabase.from('posts').select().match({ id }).single()

  if (!post) {
    notFound()
  }

  return <pre>{JSON.stringify(post, null, 2)}</pre>
}
```

---

TITLE: Protecting Next.js API Routes - JavaScript
DESCRIPTION: This snippet shows how to protect a Next.js API route by checking for an authenticated Supabase user. It creates a server-side Supabase client, verifies the user's session, and if no user is found, returns a 401 unauthorized error. Otherwise, it proceeds to query the database with RLS.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs-pages.mdx#_snippet_16

LANGUAGE: jsx
CODE:

```
import { createPagesServerClient } from '@supabase/auth-helpers-nextjs'

const ProtectedRoute = async (req, res) => {
  // Create authenticated Supabase Client
  const supabase = createPagesServerClient({ req, res })
  // Check if we have a user
  const {
    data: { user },
  } = await supabase.auth.getUser()

  if (!user)
    return res.status(401).json({
      error: 'not_authenticated',
      description: 'The user does not have an active session or is not authenticated',
    })

  // Run queries with RLS on the server
  const { data } = await supabase.from('test').select('*')
  res.json(data)
}

export default ProtectedRoute
```

---

TITLE: Implementing User Authentication Form with Supabase in React Native
DESCRIPTION: This snippet defines the main login and registration screen for a React Native application. It includes input fields for email and password, and buttons for signing in and signing up. It utilizes Supabase's `signInWithPassword` and `signUp` methods for authentication, displaying alerts for errors and managing a loading spinner during API calls.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-08-01-react-native-storage.mdx#_snippet_4

LANGUAGE: tsx
CODE:

```
import { Alert, View, Button, TextInput, StyleSheet, Text, TouchableOpacity } from 'react-native'
import { useState } from 'react'
import React from 'react'
import Spinner from 'react-native-loading-spinner-overlay'
import { supabase } from '../config/initSupabase'

const Login = () => {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [loading, setLoading] = useState(false)

  // Sign in with email and password
  const onSignInPress = async () => {
    setLoading(true)

    const { error } = await supabase.auth.signInWithPassword({
      email,
      password,
    })

    if (error) Alert.alert(error.message)
    setLoading(false)
  }

  // Create a new user
  const onSignUpPress = async () => {
    setLoading(true)
    const { error } = await supabase.auth.signUp({
      email: email,
      password: password,
    })

    if (error) Alert.alert(error.message)
    setLoading(false)
  }

  return (
    <View style={styles.container}>
      <Spinner visible={loading} />

      <Text style={styles.header}>My Cloud</Text>

      <TextInput
        autoCapitalize="none"
        placeholder="john@doe.com"
        value={email}
        onChangeText={setEmail}
        style={styles.inputField}
      />
      <TextInput
        placeholder="password"
        value={password}
        onChangeText={setPassword}
        secureTextEntry
        style={styles.inputField}
      />

      <TouchableOpacity onPress={onSignInPress} style={styles.button}>
        <Text style={{ color: '#fff' }}>Sign in</Text>
      </TouchableOpacity>
      <Button onPress={onSignUpPress} title="Create Account" color={'#fff'}></Button>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: 200,
    padding: 20,
    backgroundColor: '#151515',
  },
  header: {
    fontSize: 30,
    textAlign: 'center',
    margin: 50,
    color: '#fff',
  },
  inputField: {
    marginVertical: 4,
    height: 50,
    borderWidth: 1,
    borderColor: '#2b825b',
    borderRadius: 4,
    padding: 10,
    color: '#fff',
    backgroundColor: '#363636',
  },
  button: {
    marginVertical: 15,
    alignItems: 'center',
    backgroundColor: '#2b825b',
    padding: 12,
    borderRadius: 4,
  },
})

export default Login
```

---

TITLE: Inserting Multiple Rows into a Table (SQL)
DESCRIPTION: This SQL `INSERT` statement adds two new movie records, 'The Empire Strikes Back' and 'Return of the Jedi', into the `movies` table. It specifies `name` and `description` columns for the data insertion.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/tables.mdx#_snippet_3

LANGUAGE: SQL
CODE:

```
insert into movies
  (name, description)
values
  (
    'The Empire Strikes Back',
    'After the Rebels are brutally overpowered by the Empire on the ice planet Hoth, Luke Skywalker begins Jedi training with Yoda.'
  ),
  (
    'Return of the Jedi',
    'After a daring mission to rescue Han Solo from Jabba the Hutt, the Rebels dispatch to Endor to destroy the second Death Star.'
  );
```

---

TITLE: Creating Users via Admin API with Edge Functions (SQL/JavaScript)
DESCRIPTION: This example illustrates how to use `edge.exec` to execute JavaScript code that interacts with the Supabase Auth Admin API. The embedded JavaScript calls `supabase.auth.admin.createUser` to create a new user with a specified email, password, and user metadata, enabling administrative user management directly from SQL.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-11-13-supabase-dynamic-functions.mdx#_snippet_14

LANGUAGE: SQL
CODE:

```
select edge.exec(
$js$

const { data, error } = await supabase.auth.admin.createUser({
  email: 'user@email.com',
  password: 'password',
  user_metadata: { name: 'Yoda' }
});

$js$));
```

---

TITLE: Initializing Supabase Client in TypeScript
DESCRIPTION: This TypeScript snippet demonstrates how to create and export a Supabase client instance using the `createClient` function from `@supabase/supabase-js`. It retrieves the Supabase URL and `anon` key from environment variables, enabling the application to interact with Supabase services like authentication and database operations.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-ionic-vue.mdx#_snippet_3

LANGUAGE: typescript
CODE:

```
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL as string;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

export const supabase = createClient(supabaseUrl, supabaseAnonKey);
```

---

TITLE: Creating a SELECT Policy for User's Own Profile
DESCRIPTION: This policy restricts `SELECT` access on the `profiles` table, allowing users to view only their own profile. It achieves this by comparing the authenticated user's ID (`auth.uid()`) with the `user_id` column of the profile.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/row-level-security.mdx#_snippet_6

LANGUAGE: SQL
CODE:

```
create policy "User can see their own profile only."
on profiles
for select using ( (select auth.uid()) = user_id );
```

---

TITLE: Configuring Supabase Environment Variables
DESCRIPTION: This snippet shows the required environment variables for connecting a Next.js application to Supabase. `NEXT_PUBLIC_SUPABASE_URL` is the URL of your Supabase project, and `NEXT_PUBLIC_SUPABASE_ANON_KEY` is your client-side API key for anonymous access.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/realtime/nextjs-auth-presence/README.md#_snippet_0

LANGUAGE: Text
CODE:

```
NEXT_PUBLIC_SUPABASE_URL=<<insert-your-db-url-here>>

NEXT_PUBLIC_SUPABASE_ANON_KEY=<<insert-your-anon-key-here>>
```

---

TITLE: Configuring Supabase Environment Variables
DESCRIPTION: This snippet defines environment variables for the Supabase API URL and the `anon` key in a `.env` file. These variables are crucial for the application to connect and authenticate with the Supabase project.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-solidjs.mdx#_snippet_2

LANGUAGE: bash
CODE:

```
VITE_SUPABASE_URL=YOUR_SUPABASE_URL
VITE_SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
```

---

TITLE: Performing Hybrid Search with LangChain and Supabase
DESCRIPTION: This JavaScript code demonstrates how to use the `SupabaseHybridSearch` retriever from LangChain to perform a hybrid search (combining similarity and keyword search) against a Supabase backend. It initializes a Supabase client and OpenAI embeddings, then configures the retriever with table and query names, and finally executes a search query.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-04-14-dbdev.mdx#_snippet_3

LANGUAGE: JavaScript
CODE:

```
import { OpenAIEmbeddings } from 'langchain/embeddings/openai'
import { createClient } from '@supabase/supabase-js'
import { SupabaseHybridSearch } from 'langchain/retrievers/supabase'

const privateKey = process.env.SUPABASE_PRIVATE_KEY
if (!privateKey) throw new Error(`Expected env var SUPABASE_PRIVATE_KEY`)

const url = process.env.SUPABASE_URL
if (!url) throw new Error(`Expected env var SUPABASE_URL`)

export const run = async () => {
  const client = createClient(url, privateKey)

  const embeddings = new OpenAIEmbeddings()

  const retriever = new SupabaseHybridSearch(embeddings, {
    client,
    //  Below are the defaults, expecting that you set up your supabase table and functions according to the guide above. Please change if necessary.
    similarityK: 2,
    keywordK: 2,
    tableName: 'documents',
    similarityQueryName: 'match_documents',
    keywordQueryName: 'kw_match_documents',
  })

  const results = await retriever.getRelevantDocuments('hello bye')

  console.log(results)
}
```

---

TITLE: Initializing Supabase Client
DESCRIPTION: This section demonstrates how to initialize the Supabase client using your project's URL and anonymous public API key. These credentials can be found in your Supabase project's API Settings.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/realtime/presence.mdx#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import { createClient } from '@supabase/supabase-js'

const SUPABASE_URL = 'https://<project>.supabase.co'
const SUPABASE_KEY = '<your-anon-key>'

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY)
```

LANGUAGE: Dart
CODE:

```
void main() {
  Supabase.initialize(
    url: 'https://<project>.supabase.co',
    anonKey: '<your-anon-key>',
  );

  runApp(MyApp());
}

final supabase = Supabase.instance.client;
```

LANGUAGE: Swift
CODE:

```
let supabaseURL = "https://<project>.supabase.co"
let supabaseKey = "<your-anon-key>"
let supabase = SupabaseClient(supabaseURL: URL(string: supabaseURL)!, supabaseKey: supabaseKey)

let realtime = supabase.realtime
```

LANGUAGE: Kotlin
CODE:

```
val supabaseUrl = "https://<project>.supabase.co"
val supabaseKey = "<your-anon-key>"
val supabase = createSupabaseClient(supabaseUrl, supabaseKey) {
    install(Realtime)
}
```

LANGUAGE: Python
CODE:

```
from supabase import create_client

SUPABASE_URL = 'https://<project>.supabase.co'
SUPABASE_KEY = '<your-anon-key>'

supabase = create_client(SUPABASE_URL, SUPABASE_KEY)
```

---

TITLE: Implement Supabase Authentication Middleware in Next.js
DESCRIPTION: This code snippet provides the implementation for a Next.js middleware designed to handle Supabase authentication. Its primary functions include refreshing expired authentication tokens by calling `supabase.auth.getUser()`, and then propagating these refreshed tokens to both Server Components (via `request.cookies.set`) and the user's browser (via `response.cookies.set`). The `config.matcher` is used to specify paths where the middleware should run, optimizing performance. A critical security warning is highlighted: always use `supabase.auth.getUser()` for protecting pages and user data, and never rely on `supabase.auth.getSession()` in server-side code like middleware, as it does not guarantee token revalidation. The snippet also includes important guidelines on the correct handling of `supabaseResponse` and the placement of `auth.getUser()` calls to prevent session issues.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/server-side/nextjs.mdx#_snippet_3

LANGUAGE: TypeScript
CODE:

```
import { type NextRequest } from 'next/server'
import { updateSession } from '@/utils/supabase/middleware'

export async function middleware(request: NextRequest) {
  return await updateSession(request)
}

export const config = {
  matcher: [
    /*
     * Match all request paths except for the ones starting with:
     * - _next/static (static files)
     * - _next/image (image optimization files)
     * - favicon.ico (favicon file)
     * Feel free to modify this pattern to include more paths.
     */
    '/((?!_next/static|_next/image|favicon.ico|.*\.(?:svg|png|jpg|jpeg|gif|webp)$).*)'
  ]
}
```

LANGUAGE: TypeScript
CODE:

```
import { createServerClient } from '@supabase/ssr'
import { NextResponse, type NextRequest } from 'next/server'

export async function updateSession(request: NextRequest) {
  let supabaseResponse = NextResponse.next({
    request
  })

  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return request.cookies.getAll()
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value, options }) => request.cookies.set(name, value))
          supabaseResponse = NextResponse.next({
            request
          })
          cookiesToSet.forEach(({ name, value, options }) =>
            supabaseResponse.cookies.set(name, value, options)
          )
        }
      }
    }
  )

  // Do not run code between createServerClient and
  // supabase.auth.getUser(). A simple mistake could make it very hard to debug
  // issues with users being randomly logged out.

  // IMPORTANT: DO NOT REMOVE auth.getUser()

  const {
    data: { user }
  } = await supabase.auth.getUser()

  if (
    !user &&
    !request.nextUrl.pathname.startsWith('/login') &&
    !request.nextUrl.pathname.startsWith('/auth')
  ) {
    // no user, potentially respond by redirecting the user to the login page
    const url = request.nextUrl.clone()
    url.pathname = '/login'
    return NextResponse.redirect(url)
  }

  // IMPORTANT: You *must* return the supabaseResponse object as it is.
  // If you're creating a new response object with NextResponse.next() make sure to:
  // 1. Pass the request in it, like so:
  //    const myNewResponse = NextResponse.next({ request })
  // 2. Copy over the cookies, like so:
  //    myNewResponse.cookies.setAll(supabaseResponse.cookies.getAll())
  // 3. Change the myNewResponse object to fit your needs, but avoid changing
  //    the cookies!
  // 4. Finally:
  //    return myNewResponse
  // If this is not done, you may be causing the browser and server to go out
  // of sync and terminate the user's session prematurely!

  return supabaseResponse
}
```

---

TITLE: Enabling pgvector Extension in PostgreSQL (SQL)
DESCRIPTION: Enables the `pgvector` extension in your PostgreSQL database schema, which is required for storing and querying vector embeddings for similarity search.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/examples/nextjs-vector-search.mdx#_snippet_2

LANGUAGE: sql
CODE:

```
-- Enable pgvector extension
create extension if not exists vector with schema public;
```

---

TITLE: Implement Supabase Login and Signup Server Actions
DESCRIPTION: This server-side code defines `login` and `signup` functions using Supabase for user authentication. It handles form data, calls Supabase authentication methods, and redirects users based on success or error, revalidating the path on success.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/server-side/nextjs.mdx#_snippet_5

LANGUAGE: ts
CODE:

```
'use server'

import { revalidatePath } from 'next/cache'
import { redirect } from 'next/navigation'

import { createClient } from '@/utils/supabase/server'

export async function login(formData: FormData) {
  const supabase = await createClient()

  // type-casting here for convenience
  // in practice, you should validate your inputs
  const data = {
    email: formData.get('email') as string,
    password: formData.get('password') as string,
  }

  const { error } = await supabase.auth.signInWithPassword(data)

  if (error) {
    redirect('/error')
  }

  revalidatePath('/', 'layout')
  redirect('/')
}

export async function signup(formData: FormData) {
  const supabase = await createClient()

  // type-casting here for convenience
  // in practice, you should validate your inputs
  const data = {
    email: formData.get('email') as string,
    password: formData.get('password') as string,
  }

  const { error } = await supabase.auth.signUp(data)

  if (error) {
    redirect('/error')
  }

  revalidatePath('/', 'layout')
  redirect('/')
}
```

---

TITLE: Initializing Supabase Client in SvelteKit (JavaScript)
DESCRIPTION: This JavaScript snippet creates `src/lib/supabaseClient.js` to initialize the Supabase client. It imports `createClient` from `@supabase/supabase-js` and exports a `supabase` instance configured with the project's URL and public (anon) key, enabling database interactions.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/quickstarts/sveltekit.mdx#_snippet_2

LANGUAGE: javascript
CODE:

```
import { createClient } from '@supabase/supabase-js'

export const supabase = createClient('https://<project>.supabase.co', '<your-anon-key>')
```

---

TITLE: Creating an Avatar Upload Widget in Flutter
DESCRIPTION: This snippet defines a `StatefulWidget` called `Avatar` that enables users to select an image from their gallery, upload it to Supabase Storage, and display the current avatar. It handles image picking, byte conversion, file naming, and Supabase storage interactions, including generating a signed URL. Error handling for storage operations is also included.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-flutter.mdx#_snippet_12

LANGUAGE: Dart
CODE:

```
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_quickstart/main.dart';

class Avatar extends StatefulWidget {
  const Avatar({
    super.key,
    required this.imageUrl,
    required this.onUpload,
  });

  final String? imageUrl;
  final void Function(String) onUpload;

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.imageUrl == null || widget.imageUrl!.isEmpty)
          Container(
            width: 150,
            height: 150,
            color: Colors.grey,
            child: const Center(
              child: Text('No Image'),
            ),
          )
        else
          Image.network(
            widget.imageUrl!,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        ElevatedButton(
          onPressed: _isLoading ? null : _upload,
          child: const Text('Upload'),
        ),
      ],
    );
  }

  Future<void> _upload() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
    );
    if (imageFile == null) {
      return;
    }
    setState(() => _isLoading = true);

    try {
      final bytes = await imageFile.readAsBytes();
      final fileExt = imageFile.path.split('.').last;
      final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
      final filePath = fileName;
      await supabase.storage.from('avatars').uploadBinary(
            filePath,
            bytes,
            fileOptions: FileOptions(contentType: imageFile.mimeType),
          );
      final imageUrlResponse = await supabase.storage
          .from('avatars')
          .createSignedUrl(filePath, 60 * 60 * 24 * 365 * 10);
      widget.onUpload(imageUrlResponse);
    } on StorageException catch (error) {
      if (mounted) {
        context.showSnackBar(error.message, isError: true);
      }
    } catch (error) {
      if (mounted) {
        context.showSnackBar('Unexpected error occurred', isError: true);
      }
    }

    setState(() => _isLoading = false);
  }
}
```

---

TITLE: Declaring Supabase Environment Variables (.env.local)
DESCRIPTION: This snippet shows how to declare public Supabase URL and anonymous key as environment variables in a `.env.local` file. These variables are crucial for the Supabase client to connect to your project's API and are retrieved from your Supabase project settings.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/sveltekit.mdx#_snippet_1

LANGUAGE: bash
CODE:

```
# Find these in your Supabase project settings https://supabase.com/dashboard/project/_/settings/api
PUBLIC_SUPABASE_URL=https://your-project.supabase.co
PUBLIC_SUPABASE_ANON_KEY=your-anon-key
```

---

TITLE: Optimizing Filtered Sequential Scans in PostgreSQL
DESCRIPTION: This EXPLAIN ANALYZE output demonstrates a long-running Sequential Scan on the products table with a filter condition. The high number of 'Rows Removed by Filter' (2997 out of 3000) indicates that an index on the 'price' column would significantly improve performance by avoiding a full table scan.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/understanding-postgresql-explain-output-Un9dqX.mdx#_snippet_5

LANGUAGE: PostgreSQL Explain Output
CODE:

```
Seq Scan on products  (cost=0.00..100.00 rows=300 width=50) (actual time=50.000..100.000 rows=3 loops=1)
   Filter: (price > 1000)
   Rows Removed by Filter: 2997
```

---

TITLE: Querying Document Sections with RLS Applied (JWT/REST API) - SQL
DESCRIPTION: This SQL query selects document sections based on an embedding similarity match. When executed via the REST API with a valid JWT, Row Level Security (RLS) automatically filters the results to include only document sections owned by the user identified by the JWT's `sub` claim, leveraging the `auth.uid()` function.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/rag-with-permissions.mdx#_snippet_13

LANGUAGE: SQL
CODE:

```
-- Only document sections owned by the user are returned
select *
from document_sections
where document_sections.embedding <#> embedding < -match_threshold
order by document_sections.embedding <#> embedding;
```

---

TITLE: Calling Supabase RPC Function to Test Authorization Header in JavaScript
DESCRIPTION: This JavaScript snippet demonstrates how to call the `test_authorization_header` SQL function using the Supabase client's `rpc` method. It retrieves the JWT payload, logs the user's role and UUID, and helps verify if a user session is correctly established when making database calls from the client-side application.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/why-is-my-select-returning-an-empty-data-array-and-i-have-data-in-the-table-xvOPgx.mdx#_snippet_1

LANGUAGE: JavaScript
CODE:

```
const { data: testData, error: testError } = await supabase.rpc('test_authorization_header')
console.log(`The user role is ${testData.role} and the user UUID is ${testData.sub}. `, testError)
```

---

TITLE: Creating Typed Supabase Server Client in API Route (TypeScript)
DESCRIPTION: This TypeScript example illustrates how to create a typed Supabase server client within a Next.js API route using `createPagesServerClient`. It fetches user data from authentication, providing type safety for both the client and the user object.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs-pages.mdx#_snippet_9

LANGUAGE: tsx
CODE:

```
// Creating a new supabase server client object (e.g. in API route):
import { createPagesServerClient } from '@supabase/auth-helpers-nextjs'
import type { NextApiRequest, NextApiResponse } from 'next'
import type { Database } from 'types_db'

export default async (req: NextApiRequest, res: NextApiResponse) => {
  const supabaseServerClient = createPagesServerClient<Database>({
    req,
    res,
  })
  const {
    data: { user },
  } = await supabaseServerClient.auth.getUser()

  res.status(200).json({ name: user?.name ?? '' })
}
```

---

TITLE: Creating a SELECT Policy for User-Owned Data in Postgres
DESCRIPTION: This policy allows individuals to view only their own 'todos' by comparing the authenticated user's ID (obtained via `auth.uid()`) with the `user_id` column in the `todos` table. It acts as an implicit `WHERE` clause for `SELECT` operations.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/row-level-security.mdx#_snippet_1

LANGUAGE: SQL
CODE:

```
create policy "Individuals can view their own todos."
on todos for select
using ( (select auth.uid()) = user_id );
```

---

TITLE: Defining User Profiles Table and Row Level Security Policies (SQL)
DESCRIPTION: This SQL script defines the 'profiles' table, sets up Row Level Security (RLS) policies for public viewing, user-specific insertion and updates, and creates a trigger to automatically create a profile entry upon new user sign-up. It also configures a 'storage.buckets' entry for avatars and sets up RLS policies for avatar image access.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/user-management/nextjs-user-management/README.md#_snippet_1

LANGUAGE: sql
CODE:

```
-- Create a table for public profiles
create table profiles (
  id uuid references auth.users not null primary key,
  updated_at timestamp with time zone,
  username text unique,
  full_name text,
  avatar_url text,
  website text,

  constraint username_length check (char_length(username) >= 3)
);
-- Set up Row Level Security (RLS)
-- See https://supabase.com/docs/guides/auth/row-level-security for more details.
alter table profiles
  enable row level security;

create policy "Public profiles are viewable by everyone." on profiles
  for select using (true);

create policy "Users can insert their own profile." on profiles
  for insert with check ((select auth.uid()) = id);

create policy "Users can update own profile." on profiles
  for update using ((select auth.uid()) = id);

-- This trigger automatically creates a profile entry when a new user signs up via Supabase Auth.
-- See https://supabase.com/docs/guides/auth/managing-user-data#using-triggers for more details.
create function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, full_name, avatar_url)
  values (new.id, new.raw_user_meta_data->>'full_name', new.raw_user_meta_data->>'avatar_url');
  return new;
end;
$$ language plpgsql security definer;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- Set up Storage!
insert into storage.buckets (id, name)
  values ('avatars', 'avatars');

-- Set up access controls for storage.
-- See https://supabase.com/docs/guides/storage#policy-examples for more details.
create policy "Avatar images are publicly accessible." on storage.objects
  for select using (bucket_id = 'avatars');

create policy "Anyone can upload an avatar." on storage.objects
  for insert with check (bucket_id = 'avatars');

create policy "Anyone can update their own avatar." on storage.objects
  for update using ( auth.uid() = owner ) with check (bucket_id = 'avatars');
```

---

TITLE: Unnesting Response Status Code in Supabase Edge Logs (SQL)
DESCRIPTION: This query specifically targets the `status_code` within the `metadata.response` field of `edge_logs`. It provides a direct way to filter and analyze API responses based on their HTTP status, enabling quick detection of successful requests (e.g., 200) or various error types (e.g., 404, 500).
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/discovering-and-interpreting-api-errors-in-the-logs-7xREI9.mdx#_snippet_4

LANGUAGE: SQL
CODE:

```
select
  status_code
from
  edge_logs
  -- Unpack 'metadata' field
  cross join unnest(metadata) as metadata
  -- unpack 'response' from 'metadata'
  cross join unnest(response) as response;
```

---

TITLE: Querying Supabase Data with .then() and async/await in JavaScript
DESCRIPTION: This snippet demonstrates two ways to query data from a Supabase table named 'countries': using promise-based `.then()` syntax and modern `async/await` syntax. Both methods select all columns, limit the results to 5 records, and log the data or any errors to the console.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2021-03-11-using-supabase-replit.mdx#_snippet_2

LANGUAGE: JavaScript
CODE:

```
// .then() syntax
supabase.
  .from('countries')
  .select('*')
  .limit(5)
  .then(console.log)
  .catch(console.error)

// or...
// async/await syntax
const main = async() => {
  const { data, error } = supabase
    .from('countries')
    .select('*')
    .limit(5)

  if (error) {
    console.log(error)
    return
  }

  console.log(data)
}
main()
```

---

TITLE: Migrating Supabase Storage Objects using JavaScript
DESCRIPTION: This script facilitates the migration of Storage objects between two Supabase projects. It connects to both old and new projects using their respective URLs and service keys, fetches all objects from the old project's storage, downloads each object, and then uploads it to the corresponding bucket in the new project. It handles potential errors during object retrieval, download, and upload, and includes options for upserting and preserving metadata like content type and cache control.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/platform/migrating-within-supabase/backup-restore.mdx#_snippet_9

LANGUAGE: JavaScript
CODE:

```
// npm install @supabase/supabase-js@1
const { createClient } = require('@supabase/supabase-js')

const OLD_PROJECT_URL = 'https://xxx.supabase.co'
const OLD_PROJECT_SERVICE_KEY = 'old-project-service-key-xxx'

const NEW_PROJECT_URL = 'https://yyy.supabase.co'
const NEW_PROJECT_SERVICE_KEY = 'new-project-service-key-yyy'

;(async () => {
  const oldSupabaseRestClient = createClient(OLD_PROJECT_URL, OLD_PROJECT_SERVICE_KEY, {
    db: {
      schema: 'storage',
    },
  })
  const oldSupabaseClient = createClient(OLD_PROJECT_URL, OLD_PROJECT_SERVICE_KEY)
  const newSupabaseClient = createClient(NEW_PROJECT_URL, NEW_PROJECT_SERVICE_KEY)

  // make sure you update max_rows in postgrest settings if you have a lot of objects
  // or paginate here
  const { data: oldObjects, error } = await oldSupabaseRestClient.from('objects').select()
  if (error) {
    console.log('error getting objects from old bucket')
    throw error
  }

  for (const objectData of oldObjects) {
    console.log(`moving ${objectData.id}`)
    try {
      const { data, error: downloadObjectError } = await oldSupabaseClient.storage
        .from(objectData.bucket_id)
        .download(objectData.name)
      if (downloadObjectError) {
        throw downloadObjectError
      }

      const { _, error: uploadObjectError } = await newSupabaseClient.storage
        .from(objectData.bucket_id)
        .upload(objectData.name, data, {
          upsert: true,
          contentType: objectData.metadata.mimetype,
          cacheControl: objectData.metadata.cacheControl,
        })
      if (uploadObjectError) {
        throw uploadObjectError
      }
    } catch (err) {
      console.log('error moving ', objectData)
      console.log(err)
    }
  }
})()
```

---

TITLE: Defining RLS Policy with `exists` and `auth.uid()` in SQL
DESCRIPTION: This SQL snippet defines a Row Level Security policy named 'rls_test_select' on 'test_table'. It restricts access to authenticated users, allowing selection only if their `auth.uid()` matches a 'user_id' in 'roles_table' where the 'role' is 'good_role'. This policy demonstrates a common RLS setup that might incur performance penalties due to the subquery.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/row-level-security.mdx#_snippet_19

LANGUAGE: SQL
CODE:

```
create policy "rls_test_select" on test_table
to authenticated
using (
  exists (
    select 1 from roles_table
    where (select auth.uid()) = user_id and role = 'good_role'
  )
);
```

---

TITLE: Configuring Supabase Postgres Profiles Table, RLS, Realtime, and Storage
DESCRIPTION: This SQL script defines the `profiles` table with user-related information, establishes Row Level Security (RLS) policies to control data access based on user authentication, sets up Realtime capabilities for the `profiles` table, and initializes a storage bucket for user avatars. RLS policies ensure users can only view public profiles, insert their own, and update their own profile data.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/user-management/solid-user-management/README.md#_snippet_3

LANGUAGE: sql
CODE:

```
-- Create a table for Public Profiles
create table
	profiles (
		id uuid references auth.users not null,
		updated_at timestamp
		with
			time zone,
			username text unique,
			avatar_url text,
			website text,
			primary key (id),
			unique (username),
			constraint username_length check (char_length(username) >= 3)
	);

alter table
	profiles enable row level security;

create policy "Public profiles are viewable by everyone." on profiles for
select
	using (true);

create policy "Users can insert their own profile." on profiles for insert
with
	check ((select auth.uid()) = id);

create policy "Users can update own profile." on profiles for
update
	using ((select auth.uid()) = id);

-- Set up Realtime!
begin;

drop
	publication if exists supabase_realtime;

create publication supabase_realtime;

commit;

alter
	publication supabase_realtime add table profiles;

-- Set up Storage!
insert into
	storage.buckets (id, name)
values
	('avatars', 'avatars');

create policy "Avatar images are publicly accessible." on storage.objects for
select
	using (bucket_id = 'avatars');

create policy "Anyone can upload an avatar." on storage.objects for insert
with
	check (bucket_id = 'avatars');
```

---

TITLE: Helper Functions for Image Encoding and Embedding Generation (Python)
DESCRIPTION: Defines four helper functions: `readFileAsBase64` for encoding images, `construct_bedrock_image_body` for creating the Bedrock API request body, `get_embedding_from_titan_multimodal` for invoking the Titan model, and `encode_image` to orchestrate the embedding process for a given image file path.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-03-26-semantic-image-search-amazon-bedrock.mdx#_snippet_4

LANGUAGE: Python
CODE:

```
def readFileAsBase64(file_path):
    """Encode image as base64 string."""
    try:
        with open(file_path, "rb") as image_file:
            input_image = base64.b64encode(image_file.read()).decode("utf8")
        return input_image
    except:
        print("bad file name")
        sys.exit(0)


def construct_bedrock_image_body(base64_string):
    """Construct the request body.

    https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters-titan-embed-mm.html
    """
    return json.dumps(
        {
            "inputImage": base64_string,
            "embeddingConfig": {"outputEmbeddingLength": 1024},
        }
    )


def get_embedding_from_titan_multimodal(body):
    """Invoke the Amazon Titan Model via API request."""
    response = bedrock_client.invoke_model(
        body=body,
        modelId="amazon.titan-embed-image-v1",
        accept="application/json",
        contentType="application/json",
    )

    response_body = json.loads(response.get("body").read())
    print(response_body)
    return response_body["embedding"]


def encode_image(file_path):
    """Generate embedding for the image at file_path."""
    base64_string = readFileAsBase64(file_path)
    body = construct_bedrock_image_body(base64_string)
    emb = get_embedding_from_titan_multimodal(body)
    return emb
```

---

TITLE: Querying a Vecs Collection with Metadata Filters (Python)
DESCRIPTION: This Python snippet shows how to query a `vecs` collection to retrieve relevant matches based on input data. It includes an example of applying metadata filters (e.g., 'year' equals 2012) and limiting the number of returned records, enabling precise search capabilities.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/vecs-python-client.mdx#_snippet_3

LANGUAGE: python
CODE:

```
import vecs

docs = vecs.get_or_create_collection(name="docs", dimension=3)

# query the collection filtering metadata for "year" = 2012
docs.query(
    data=[0.4,0.5,0.6],      # required
    limit=1,                         # number of records to return
    filters={"year": {"$eq": 2012}} # metadata filters
)
```

---

TITLE: Analyzing PostgreSQL Query Execution Plan
DESCRIPTION: This PostgreSQL command executes a given query and displays its execution plan, including actual row counts and timing information. It is crucial for identifying performance bottlenecks and optimizing slow queries by understanding how the database processes them.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/canceling-statement-due-to-statement-timeout-581wFv.mdx#_snippet_1

LANGUAGE: SQL
CODE:

```
explain analyze <query-statement-here>;
```

---

TITLE: Creating Embeddings with OpenAI API (TypeScript)
DESCRIPTION: This snippet demonstrates how to generate a vector embedding for a user's question using the OpenAI `text-embedding-ada-002` model. It sends a POST request to the OpenAI embeddings API, handling potential errors and extracting the generated embedding from the response. The `openAiKey` is required for authorization, and `sanitizedQuery` is the input text.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/examples/nextjs-vector-search.mdx#_snippet_10

LANGUAGE: TypeScript
CODE:

```
const embeddingResponse = await fetch('https://api.openai.com/v1/embeddings', {
  method: 'POST',
  headers: {
    Authorization: `Bearer ${openAiKey}`,
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    model: 'text-embedding-ada-002',
    input: sanitizedQuery.replaceAll('\n', ' '),
  }),
})

if (embeddingResponse.status !== 200) {
  throw new ApplicationError('Failed to create embedding for question', embeddingResponse)
}

const {
  data: [{ embedding }],
} = await embeddingResponse.json()
```

---

TITLE: Redirecting to Supabase OAuth Authorize URL with PKCE (TypeScript)
DESCRIPTION: This TypeScript snippet demonstrates how to initiate the Supabase OAuth 2.0 authorization flow. It constructs the authorization URL, generates a PKCE `codeVerifier`, stores it in the user's session, and then redirects the user to the Supabase authorization endpoint. This is a crucial step for obtaining user consent and initiating the token exchange process.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/integrations/build-a-supabase-integration.mdx#_snippet_0

LANGUAGE: TypeScript
CODE:

```
router.get('/connect-supabase/login', async (ctx) => {
  // Construct the URL for the authorization redirect and get a PKCE codeVerifier.
  const { uri, codeVerifier } = await oauth2Client.code.getAuthorizationUri()
  console.log(uri.toString())
  // console.log: https://api.supabase.com/v1/oauth/authorize?response_type=code&client_id=7673bde9-be72-4d75-bd5e-b0dba2c49b38&redirect_uri=http%3A%2F%2Flocalhost%3A54321%2Ffunctions%2Fv1%2Fconnect-supabase%2Foauth2%2Fcallback&scope=all&code_challenge=jk06R69S1bH9dD4td8mS5kAEFmEbMP5P0YrmGNAUVE0&code_challenge_method=S256

  // Store the codeVerifier in the user session (cookie).
  ctx.state.session.flash('codeVerifier', codeVerifier)

  // Redirect the user to the authorization endpoint.
  ctx.response.redirect(uri)
})
```

---

TITLE: Enabling Row Level Security for a Table in Postgres
DESCRIPTION: This SQL snippet demonstrates how to enable Row Level Security (RLS) on a specified table within a given schema. Enabling RLS is crucial for securing data, especially in exposed schemas like `public`, as it ensures that data access is governed by defined policies.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/row-level-security.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
alter table <schema_name>.<table_name>
enable row level security;
```

---

TITLE: Creating an UPDATE Policy for User-Owned Profiles
DESCRIPTION: This example demonstrates creating an `UPDATE` policy for the `profiles` table. It allows authenticated users to update only their own profile, using both `using` (for existing rows) and `with check` (for new row data) clauses to ensure the `user_id` remains consistent with the authenticated user's ID.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/row-level-security.mdx#_snippet_8

LANGUAGE: SQL
CODE:

```
create table profiles (
  id uuid primary key,
  user_id uuid references auth.users,
  avatar_url text
);

alter table profiles enable row level security;

create policy "Users can update their own profile."
on profiles for update
to authenticated                    -- the Postgres Role (recommended)
using ( (select auth.uid()) = user_id )       -- checks if the existing row complies with the policy expression
with check ( (select auth.uid()) = user_id ); -- checks if the new row complies with the policy expression
```

---

TITLE: Generating Supabase TypeScript Types with CLI
DESCRIPTION: This command demonstrates how to generate TypeScript types for your Supabase project using the Supabase CLI. The generated types are piped to a file named `database.types.ts`, providing type safety based on your database schema.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/docs/ref/javascript/typescript-support.mdx#_snippet_0

LANGUAGE: bash
CODE:

```
supabase gen types typescript --project-id abcdefghijklmnopqrst > database.types.ts
```

---

TITLE: Generating and Storing OpenAI Embeddings with JavaScript
DESCRIPTION: This asynchronous JavaScript function demonstrates how to generate text embeddings using the OpenAI API and store them in a Supabase PostgreSQL database. It initializes the OpenAI client, fetches documents (via a placeholder `getDocuments` function), processes each document by replacing newlines, generates a 1536-dimensional embedding using `text-embedding-ada-002`, and then inserts the original content and its embedding into the `documents` table using the Supabase client. It requires `openai` and `@supabase/supabase-js` libraries.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-02-03-openai-embeddings-postgres-vector.mdx#_snippet_4

LANGUAGE: JavaScript
CODE:

```
import { createClient } from '@supabase/supabase-js'
import { Configuration, OpenAIApi } from 'openai'
import { supabaseClient } from './lib/supabase'

async function generateEmbeddings() {
  const configuration = new Configuration({ apiKey: '<YOUR_OPENAI_API_KEY>' })
  const openAi = new OpenAIApi(configuration)

  const documents = await getDocuments() // Your custom function to load docs

  // Assuming each document is a string
  for (const document of documents) {
    // OpenAI recommends replacing newlines with spaces for best results
    const input = document.replace(/\n/g, ' ')

    const embeddingResponse = await openAi.createEmbedding({
      model: 'text-embedding-ada-002',
      input,
    })

    const [{ embedding }] = embeddingResponse.data.data

    // In production we should handle possible errors
    await supabaseClient.from('documents').insert({
      content: document,
      embedding,
    })
  }
}
```

---

TITLE: Configuring Supabase Environment Variables (Env)
DESCRIPTION: This snippet shows the essential environment variables required to connect your React Router project to Supabase. These variables, VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY, are crucial for authentication and API communication. They can be found in the Supabase dashboard for hosted projects or via `supabase start`/`supabase status` for local instances.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/ui-library/content/docs/react-router/client.mdx#_snippet_0

LANGUAGE: env
CODE:

```
VITE_SUPABASE_URL=
VITE_SUPABASE_ANON_KEY=
```

---

TITLE: Correct: Supabase SSR Cookie Handling Pattern (TypeScript)
DESCRIPTION: This snippet illustrates the REQUIRED and correct pattern for handling cookies when initializing Supabase clients for SSR. It mandates the use of `getAll()` and `setAll(cookiesToSet)` methods, ensuring proper session management and preventing application breakage. AI models MUST always generate this exact pattern.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/prompts/nextjs-supabase-auth.md#_snippet_2

LANGUAGE: typescript
CODE:

```
{
  cookies: {
    getAll() {
      return cookieStore.getAll()
    },
    setAll(cookiesToSet) {
      const response = NextResponse.next({
        request,
      })

      cookiesToSet.forEach(({ name, value, options }) => {
        response.cookies.set(name, value, options)
      })

      return response
    }
  }
}
```

---

TITLE: Revoke Table-Level and Grant Column-Level Update Privileges (SQL)
DESCRIPTION: This SQL snippet demonstrates how to transition from table-level to column-level update privileges. It first revokes the default table-level `UPDATE` privilege from the `authenticated` role on `public.posts`, then grants specific `UPDATE` privileges only on the `title` and `content` columns to the same role. This restricts `authenticated` users to only modify these two columns.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/column-level-security.mdx#_snippet_1

LANGUAGE: sql
CODE:

```
revoke
update
  on table public.posts
from
  authenticated;

grant
update
  (title, content) on table public.posts to authenticated;
```

---

TITLE: Configuring Pre-Request Hook for Rate Limiting - Supabase SQL
DESCRIPTION: Sets the `pgrst.db_pre_request` setting for the `authenticator` role to `public.check_request`, ensuring the rate limiting function runs before every Data API request. A `notify pgrst, 'reload config'` command is issued to apply the changes immediately.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/api/securing-your-api.mdx#_snippet_11

LANGUAGE: SQL
CODE:

```
alter role authenticator
  set pgrst.db_pre_request = 'public.check_request';

notify pgrst, 'reload config';
```

---

TITLE: Initializing and Running AI Inference Session for Embeddings (JavaScript)
DESCRIPTION: This snippet demonstrates the basic usage of the new `Supabase.ai` API to instantiate an inference session with the 'gte-small' model and run inference on a text prompt. The output is a numerical embedding, suitable for storage and retrieval with pgvector.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-04-16-ai-inference-now-available-in-supabase-edge-functions.mdx#_snippet_0

LANGUAGE: JavaScript
CODE:

```
// Instantiate a new inference session
const session = new Supabase.ai.Session('gte-small')

// then use the session to run inference on a prompt
const output = await session.run('Luke, I am your father')

console.log(output)
// [ -0.047715719789266586, -0.006132732145488262, ...]
```

---

TITLE: Migrating `withMiddlewareAuth` to `createMiddlewareClient` for Next.js Middleware (After)
DESCRIPTION: This snippet demonstrates the updated approach for protecting Next.js middleware, replacing `withMiddlewareAuth` with `createMiddlewareClient`. It manually creates an authenticated Supabase client, checks for a user session and a custom authentication condition, then either forwards the request or redirects the user.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs-pages.mdx#_snippet_25

LANGUAGE: TypeScript
CODE:

```
import { createMiddlewareClient } from '@supabase/auth-helpers-nextjs'
import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'

export async function middleware(req: NextRequest) {
  // We need to create a response and hand it to the supabase client to be able to modify the response headers.
  const res = NextResponse.next()
  // Create authenticated Supabase Client.
  const supabase = createMiddlewareClient({ req, res })
  // Check if we have a session
  const {
    data: { user },
  } = await supabase.auth.getUser()

  // Check auth condition
  if (user?.email?.endsWith('@gmail.com')) {
    // Authentication successful, forward request to protected route.
    return res
  }

  // Auth condition not met, redirect to home page.
  const redirectUrl = req.nextUrl.clone()
  redirectUrl.pathname = '/'
  redirectUrl.searchParams.set(`redirectedFrom`, req.nextUrl.pathname)
  return NextResponse.redirect(redirectUrl)
}

export const config = {
  matcher: '/middleware-protected',
}
```

---

TITLE: Initializing Supabase Client (JavaScript)
DESCRIPTION: This JavaScript file (`src/supabaseClient.js`) initializes and exports a Supabase client instance. It retrieves the Supabase URL and anonymous key from environment variables, enabling the application to interact with the Supabase backend securely.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-react.mdx#_snippet_3

LANGUAGE: javascript
CODE:

```
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

export const supabase = createClient(supabaseUrl, supabaseAnonKey)
```

---

TITLE: Configuring Supabase Client for Server-Side Cookie Storage
DESCRIPTION: This code configures the Supabase client to use cookies for session storage when running in a server environment, such as Next.js Server Components. It overrides the default localStorage behavior by providing custom getItem, setItem, and removeItem functions that interact with a cookieStore (e.g., cookies() from next/headers). This is crucial for maintaining user sessions on the server.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-11-01-supabase-is-now-compatible-with-nextjs-14.mdx#_snippet_3

LANGUAGE: tsx
CODE:

```
const supabase = createClient(supabaseUrl, supabaseAnonKey, {
  auth: {
    flowType: 'pkce',
    autoRefreshToken: false,
    detectSessionInUrl: false,
    persistSession: true,
    storage: {
      getItem: async (key: string) => {
        cookieStore.get(key)
      },
      setItem: async (key: string, value: string) => {
        cookieStore.set(key, value)
      },
      removeItem: async (key: string) => {
        cookieStore.remove(key)
      }
    }
  }
})
```

---

TITLE: Implementing IP Rate Limiting Function - Supabase PL/pgSQL
DESCRIPTION: Creates a `public.check_request` PL/pgSQL function that runs before each Data API request. It checks the request method and IP, counts requests from the same IP within 5 minutes, and rejects requests exceeding 100 with a 420 HTTP status. Valid requests are logged to `private.rate_limits`.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/api/securing-your-api.mdx#_snippet_10

LANGUAGE: PL/pgSQL
CODE:

```
create function public.check_request()
  returns void
  language plpgsql
  security definer
  as $$
declare
  req_method text := current_setting('request.method', true);
  req_ip inet := split_part(
    current_setting('request.headers', true)::json->>'x-forwarded-for',
    ',', 1)::inet;
  count_in_five_mins integer;
begin
  if req_method = 'GET' or req_method = 'HEAD' or req_method is null then
    -- rate limiting can't be done on GET and HEAD requests
    return;
  end if;

  select
    count(*) into count_in_five_mins
  from private.rate_limits
  where
    ip = req_ip and request_at between now() - interval '5 minutes' and now();

  if count_in_five_mins > 100 then
    raise sqlstate 'PGRST' using
      message = json_build_object(
        'message', 'Rate limit exceeded, try again after a while')::text,
      detail = json_build_object(
        'status',  420,
        'status_text', 'Enhance Your Calm')::text;
  end if;

  insert into private.rate_limits (ip, request_at) values (req_ip, now());
end;
  $$;
```

---

TITLE: Fetching Data with Supabase JavaScript Client
DESCRIPTION: This JavaScript snippet uses the Supabase client library to query all data from the 'todos' table. It performs a select() operation and destructures the response into data and error objects, providing a concise way to retrieve records.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/api/quickstart.mdx#_snippet_4

LANGUAGE: JavaScript
CODE:

```
const { data, error } = await supabase.from('todos').select()
```

---

TITLE: Creating Supabase Browser Client Utility Function - TypeScript
DESCRIPTION: This utility function, `createClient`, is designed for client-side Supabase interactions within a Next.js application. It uses `createBrowserClient` from `@supabase/ssr` to initialize a Supabase client, requiring `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` environment variables for configuration.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/how-to-migrate-from-supabase-auth-helpers-to-ssr-package-5NRunM.mdx#_snippet_1

LANGUAGE: TypeScript
CODE:

```
// utils/supabase/client.ts

import { createBrowserClient } from '@supabase/ssr';

export function createClient() {
  return createBrowserClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
  );
}
```

---

TITLE: Defining Row Level Security Policy in Supabase SQL
DESCRIPTION: This SQL snippet defines a Row Level Security (RLS) policy named "Users can only view their own documents." on the `docs` table. It restricts `SELECT` operations, ensuring that users can only retrieve documents where their `auth.uid()` (authenticated user ID) matches the `user_id` column in the `docs` table. This policy is enforced at the database level, securing data access across all application interfaces.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_alternatives/supabase-vs-auth0.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
create policy "Users can only view their own documents."
on docs for select
using ( (select auth.uid()) = user_id );
```

---

TITLE: Defining User Profiles Table with Row Level Security Policies
DESCRIPTION: This SQL snippet defines the 'profiles' table for public user profiles, including fields for ID, update timestamp, username, avatar URL, and website. It establishes robust Row Level Security (RLS) policies to control access: public viewing, user-specific insertion, and user-specific updates. Additionally, it configures Supabase Realtime for the 'profiles' table and sets up a 'avatars' storage bucket with policies for public access and user uploads.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/user-management/react-user-management/README.md#_snippet_1

LANGUAGE: sql
CODE:

```
-- Create a table for Public Profiles
create table
  profiles (
    id uuid references auth.users not null,
    updated_at timestamp
    with
      time zone,
      username text unique,
      avatar_url text,
      website text,
      primary key (id),
      unique (username),
      constraint username_length check (char_length(username) >= 3)
  );

alter table
  profiles enable row level security;

create policy "Public profiles are viewable by everyone." on profiles for
select
  using (true);

create policy "Users can insert their own profile." on profiles for insert
with
  check ((select auth.uid()) = id);

create policy "Users can update own profile." on profiles for
update
  using ((select auth.uid()) = id);

-- Set up Realtime!
begin;

drop
  publication if exists supabase_realtime;

create publication supabase_realtime;

commit;

alter
  publication supabase_realtime add table profiles;

-- Set up Storage!
insert into
  storage.buckets (id, name)
values
  ('avatars', 'avatars');

create policy "Avatar images are publicly accessible." on storage.objects for
select
  using (bucket_id = 'avatars');

create policy "Anyone can upload an avatar." on storage.objects for insert
with
  check (bucket_id = 'avatars');
```

---

TITLE: Basic SQL DML Operations with WHERE Clause
DESCRIPTION: Demonstrates fundamental SQL Data Manipulation Language (DML) operations including SELECT, UPDATE, and DELETE, showing how to use the WHERE clause to target specific rows in a table. These operations are essential for interacting with data in a relational database.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/rls-simplified-BJTcS8.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
-- select
select *
from some_table
where id = 5;

-- update
update some_table
set id = 6
where id = 5;

-- delete
delete from some_table
where id = 6;
```

---

TITLE: Using Supabase Helper Types for Tables and Enums
DESCRIPTION: This snippet illustrates the convenience of using `Tables` and `Enums` helper types, generated by Supabase, to simplify type declarations for table rows and enum values. This reduces verbosity compared to directly accessing nested `Database` types.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/docs/ref/javascript/typescript-support.mdx#_snippet_7

LANGUAGE: ts
CODE:

```
import { Database, Tables, Enums } from "./database.types.ts";

// Before 😕
let movie: Database['public']['Tables']['movies']['Row'] = // ...

// After 😍
let movie: Tables<'movies'>
```

---

TITLE: Starting Local Supabase Stack
DESCRIPTION: This command starts the local Supabase services, including the database, authentication, and storage. It provides a local development environment for Supabase projects, printing out essential environment details like the local DB URL.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/examples/mixpeek-video-search.mdx#_snippet_3

LANGUAGE: shell
CODE:

```
supabase start
```

---

TITLE: Defining Supabase User Profiles and Storage Policies (SQL)
DESCRIPTION: This SQL script defines the `profiles` table for user data, including unique constraints and foreign key references to `auth.users`. It establishes Row Level Security policies to control access: allowing public viewing, user-specific insertion and updates. Additionally, it configures Realtime updates for the `profiles` table and sets up a `storage.buckets` entry for 'avatars' with policies for public access and anyone's upload.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/user-management/sveltekit-user-management/README.md#_snippet_0

LANGUAGE: SQL
CODE:

```
-- Create a table for Public Profiles
create table profiles (
  id uuid references auth.users not null,
  updated_at timestamp with time zone,
  username text unique,
  avatar_url text,
  website text,
  primary key (id),
  unique(username),
  constraint username_length check (char_length(username) >= 3)
);
alter table profiles enable row level security;
create policy "Public profiles are viewable by everyone."
  on profiles for select
  using ( true );
create policy "Users can insert their own profile."
  on profiles for insert
  with check ( (select auth.uid()) = id );
create policy "Users can update own profile."
  on profiles for update
  using ( (select auth.uid()) = id );
-- Set up Realtime!
begin;
  drop publication if exists supabase_realtime;
  create publication supabase_realtime;
commit;
alter publication supabase_realtime add table profiles;
-- Set up Storage!
insert into storage.buckets (id, name)
values ('avatars', 'avatars');
create policy "Avatar images are publicly accessible."
  on storage.objects for select
  using ( bucket_id = 'avatars' );
create policy "Anyone can upload an avatar."
  on storage.objects for insert
  with check ( bucket_id = 'avatars' );
```

---

TITLE: Initializing Supabase Server Client with @supabase/ssr (TypeScript)
DESCRIPTION: This asynchronous function correctly initializes a Supabase client for server-side operations in Next.js, leveraging `next/headers` for cookie access. It uses the `getAll` and `setAll` cookie methods as required by `@supabase/ssr` to maintain session state. This client is used for server components and API routes.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/prompts/nextjs-supabase-auth.md#_snippet_4

LANGUAGE: typescript
CODE:

```
import { createServerClient } from '@supabase/ssr'
import { cookies } from 'next/headers'

export async function createClient() {
  const cookieStore = await cookies()

  return createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return cookieStore.getAll()
        },
        setAll(cookiesToSet) {
          try {
            cookiesToSet.forEach(({ name, value, options }) =>
              cookieStore.set(name, value, options)
            )
          } catch {
            // The `setAll` method was called from a Server Component.
            // This can be ignored if you have middleware refreshing
            // user sessions.
          }
        }
      }
    }
  )
}
```

---

TITLE: Invoking Postgres Function with Supabase TypeScript Client
DESCRIPTION: This TypeScript snippet demonstrates how to call a PostgreSQL Database Function, `calculate_customer_discount`, using the Supabase client library's `.rpc()` method. It passes the `customer_id` as an object, leveraging auto-generated types for a type-safe invocation.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2025-05-17-simplify-backend-with-data-api.mdx#_snippet_3

LANGUAGE: tsx
CODE:

```
const { data, error } = await supabase.rpc('calculate_customer_discount', {
  customer_id: 'uuid-of-customer',
})
```

---

TITLE: Generating Supabase Storage Signed Upload URLs (Next.js API Route)
DESCRIPTION: This Next.js API route (`src/app/api/supabase/storage/route.ts`) generates a signed upload URL for Supabase Storage. It first authenticates the user session, then uses a Supabase admin client with the service role key to call `createSignedUploadUrl`, allowing secure client-side file uploads without exposing sensitive keys.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-06-18-calcom-platform-starter-kit-nextjs-supabase.mdx#_snippet_3

LANGUAGE: TypeScript
CODE:

```
import { auth } from '@/auth'
import { env } from '@/env'
import { createClient } from '@supabase/supabase-js'

export const dynamic = 'force-dynamic' // defaults to auto
export async function GET(request: Request) {
  try {
    const session = await auth()
    if (!session || !session.user.id) {
      return new Response('Unauthorized', { status: 401 })
    }
    const {
      user: { id },
    } = session
    // Generate signed upload url to use on client.
    const supabaseAdmin = createClient(env.NEXT_PUBLIC_SUPABASE_URL, env.SUPABASE_SERVICE_ROLE_KEY)

    const { data, error } = await supabaseAdmin.storage
      .from('avatars')
      .createSignedUploadUrl(id, { upsert: true })
    console.log(error)
    if (error) throw error

    return new Response(JSON.stringify(data), {
      status: 200,
    })
  } catch (e) {
    console.error(e)
    return new Response('Internal Server Error', { status: 500 })
  }
}
```

---

TITLE: Setting Up Login Page with Magic Link (Angular TypeScript)
DESCRIPTION: This Angular component (LoginPage) handles user authentication using Supabase's magic link feature. It provides an email input field and a handleLogin method that calls the signIn function from SupabaseService. The component manages loading states and displays success or error messages using Ionic's LoadingController and ToastController.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-ionic-angular.mdx#_snippet_3

LANGUAGE: typescript
CODE:

```
import { Component, OnInit } from '@angular/core'
import { SupabaseService } from '../supabase.service'

@Component({
  selector: 'app-login',
  template: `
    <ion-header>
      <ion-toolbar>
        <ion-title>Login</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content>
      <div class="ion-padding">
        <h1>Supabase + Ionic Angular</h1>
        <p>Sign in via magic link with your email below</p>
      </div>
      <ion-list inset="true">
        <form (ngSubmit)="handleLogin($event)">
          <ion-item>
            <ion-label position="stacked">Email</ion-label>
            <ion-input [(ngModel)]="email" name="email" autocomplete type="email"></ion-input>
          </ion-item>
          <div class="ion-text-center">
            <ion-button type="submit" fill="clear">Login</ion-button>
          </div>
        </form>
      </ion-list>
    </ion-content>
  `,
  styleUrls: ['./login.page.scss'],
})
export class LoginPage {
  email = ''

  constructor(private readonly supabase: SupabaseService) {}

  async handleLogin(event: any) {
    event.preventDefault()
    const loader = await this.supabase.createLoader()
    await loader.present()
    try {
      const { error } = await this.supabase.signIn(this.email)
      if (error) {
        throw error
      }
      await loader.dismiss()
      await this.supabase.createNotice('Check your email for the login link!')
    } catch (error: any) {
      await loader.dismiss()
      await this.supabase.createNotice(error.error_description || error.message)
    }
  }
}
```

---

TITLE: Installing Project Dependencies with npm
DESCRIPTION: Provides the `npm install` command to set up the necessary packages for a Next.js project integrating Supabase and React Query, including `@supabase/supabase-js`, `@tanstack/react-query`, `@supabase/ssr`, and `@supabase-cache-helpers/postgrest-react-query`.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-01-12-react-query-nextjs-app-router-cache-helpers.mdx#_snippet_0

LANGUAGE: bash
CODE:

```
npm install @supabase/supabase-js @tanstack/react-query @supabase/ssr @supabase-cache-helpers/postgrest-react-query
```

---

TITLE: Creating Products Table in Supabase SQL
DESCRIPTION: This SQL snippet creates a 'products' table in the 'public' schema. It defines columns for 'id' (UUID, primary key, defaults to a random UUID), 'name' (text), 'price' (real), and 'image' (text, nullable).
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/_partials/product_management_sql_template.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
create table
  public.products (
    id uuid not null default gen_random_uuid (),
    name text not null,
    price real not null,
    image text null,
    constraint products_pkey primary key (id)
  ) tablespace pg_default;
```

---

TITLE: Implementing Angular Account Profile Management
DESCRIPTION: This TypeScript component (`AccountComponent`) allows authenticated users to view and update their profile information. It fetches the user's profile data from Supabase upon initialization and populates a reactive form. Users can update their username, website, and avatar URL, with changes being persisted back to Supabase. It also provides a sign-out functionality.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-angular.mdx#_snippet_5

LANGUAGE: typescript
CODE:

```
import { Component, Input, OnInit } from '@angular/core'
import { FormBuilder } from '@angular/forms'
import { AuthSession } from '@supabase/supabase-js'
import { Profile, SupabaseService } from '../supabase.service'

@Component({
  selector: 'app-account',
  templateUrl: './account.component.html',
  styleUrls: ['./account.component.css'],
})
export class AccountComponent implements OnInit {
  loading = false
  profile!: Profile

  @Input()
  session!: AuthSession

  updateProfileForm = this.formBuilder.group({
    username: '',
    website: '',
    avatar_url: '',
  })

  constructor(
    private readonly supabase: SupabaseService,
    private formBuilder: FormBuilder
  ) {}

  async ngOnInit(): Promise<void> {
    await this.getProfile()

    const { username, website, avatar_url } = this.profile
    this.updateProfileForm.patchValue({
      username,
      website,
      avatar_url,
    })
  }

  async getProfile() {
    try {
      this.loading = true
      const { user } = this.session
      const { data: profile, error, status } = await this.supabase.profile(user)

      if (error && status !== 406) {
        throw error
      }

      if (profile) {
        this.profile = profile
      }
    } catch (error) {
      if (error instanceof Error) {
        alert(error.message)
      }
    } finally {
      this.loading = false
    }
  }

  async updateProfile(): Promise<void> {
    try {
      this.loading = true
      const { user } = this.session

      const username = this.updateProfileForm.value.username as string
      const website = this.updateProfileForm.value.website as string
      const avatar_url = this.updateProfileForm.value.avatar_url as string

      const { error } = await this.supabase.updateProfile({
        id: user.id,
        username,
        website,
        avatar_url,
      })
      if (error) throw error
    } catch (error) {
      if (error instanceof Error) {
        alert(error.message)
      }
    } finally {
      this.loading = false
    }
  }

  async signOut() {
    await this.supabase.signOut()
  }
}
```

---

TITLE: Process and Schedule Embedding Jobs with PL/pgSQL and pg_cron
DESCRIPTION: This PL/pgSQL function, `util.process_embeddings`, reads embedding job messages from the 'embedding_jobs' queue, groups them into batches, and invokes an 'embed' Edge Function for each batch to generate embeddings. It includes parameters for batch size, max requests, and timeout. The `cron.schedule` command then schedules this function to run every 10 seconds using `pg_cron`, ensuring continuous asynchronous processing of embedding requests.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/automatic-embeddings.mdx#_snippet_6

LANGUAGE: SQL
CODE:

```
create or replace function util.process_embeddings(
  batch_size int = 10,
  max_requests int = 10,
  timeout_milliseconds int = 5 * 60 * 1000 -- default 5 minute timeout
)
returns void
language plpgsql
as $$
declare
  job_batches jsonb[];
  batch jsonb;
begin
  with
    -- First get jobs and assign batch numbers
    numbered_jobs as (
      select
        message || jsonb_build_object('jobId', msg_id) as job_info,
        (row_number() over (order by 1) - 1) / batch_size as batch_num
      from pgmq.read(
        queue_name => 'embedding_jobs',
        vt => timeout_milliseconds / 1000,
        qty => max_requests * batch_size
      )
    ),
    -- Then group jobs into batches
    batched_jobs as (
      select
        jsonb_agg(job_info) as batch_array,
        batch_num
      from numbered_jobs
      group by batch_num
    )
  -- Finally aggregate all batches into array
  select array_agg(batch_array)
  from batched_jobs
  into job_batches;

  -- Invoke the embed edge function for each batch
  foreach batch in array job_batches loop
    perform util.invoke_edge_function(
      name => 'embed',
      body => batch,
      timeout_milliseconds => timeout_milliseconds
    );
  end loop;
end;
$$;

-- Schedule the embedding processing
select
  cron.schedule(
    'process-embeddings',
    '10 seconds',
    $$
    select util.process_embeddings();
    $$
  );
```

---

TITLE: Installing Supabase JavaScript Client (Bash)
DESCRIPTION: This command installs the `@supabase/supabase-js` package using npm, which is the official JavaScript client library for interacting with Supabase services, including Realtime.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/realtime/postgres-changes.mdx#_snippet_2

LANGUAGE: bash
CODE:

```
npm install @supabase/supabase-js
```

---

TITLE: Start the React development server
DESCRIPTION: Start the app, go to http://localhost:5173 in a browser, and open the browser console and you should see the list of instruments.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/quickstarts/reactjs.mdx#_snippet_4

LANGUAGE: bash
CODE:

```
npm run dev
```

---

TITLE: Implementing MFA Enrollment and Verification with Supabase in Flutter
DESCRIPTION: This Flutter widget handles the Multi-Factor Authentication (MFA) enrollment process. It retrieves the enrollment secret and QR code using `supabase.auth.mfa.enroll()`, displays them to the user, and then verifies the entered TOTP code using `supabase.auth.mfa.challenge()` and `supabase.auth.mfa.verify()`. Upon successful verification, the user is redirected to the home page.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-05-04-flutter-multi-factor-authentication.mdx#_snippet_8

LANGUAGE: Dart
CODE:

```
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mfa_app/main.dart';
import 'package:mfa_app/pages/auth/register_page.dart';
import 'package:mfa_app/pages/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MFAEnrollPage extends StatefulWidget {
  static const route = '/mfa/enroll';
  const MFAEnrollPage({super.key});

  @override
  State<MFAEnrollPage> createState() => _MFAEnrollPageState();
}

class _MFAEnrollPageState extends State<MFAEnrollPage> {
  final _enrollFuture = supabase.auth.mfa.enroll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup MFA'),
        actions: [
          TextButton(
            onPressed: () {
              supabase.auth.signOut();
              context.go(RegisterPage.route);
            },
            child: Text(
              'Logout',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _enrollFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final response = snapshot.data!;
          final qrCodeUrl = response.totp.qrCode;
          final secret = response.totp.secret;
          final factorId = response.id;

          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 24,
            ),
            children: [
              const Text(
                'Open your authentication app and add this app via QR code or by pasting the code below.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SvgPicture.string(
                qrCodeUrl,
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      secret,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: secret));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Copied to your clip board')));
                    },
                    icon: const Icon(Icons.copy),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Enter the code shown in your authentication app.'),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: '000000',
                ),
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                onChanged: (value) async {
                  if (value.length != 6) return;

                  // kick off the verification process once 6 characters are entered
                  try {
                    final challenge =
                        await supabase.auth.mfa.challenge(factorId: factorId);
                    await supabase.auth.mfa.verify(
                      factorId: factorId,
                      challengeId: challenge.id,
                      code: value,
                    );
                    await supabase.auth.refreshSession();
                    if (mounted) {
                      context.go(HomePage.route);
                    }
                  } on AuthException catch (error) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(error.message)));
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Unexpected error occurred')));
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
```

---

TITLE: Signing In with Magic Link using JavaScript
DESCRIPTION: Demonstrates how to initiate a passwordless login using a Magic Link via email with the Supabase JavaScript client library. The `signInWithOtp` method is used, allowing configuration for automatic user signup and a redirect URL after the link is clicked.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-email-passwordless.mdx#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import { createClient } from '@supabase/supabase-js'
const supabase = createClient('url', 'anonKey')

// ---cut---
async function signInWithEmail() {
  const { data, error } = await supabase.auth.signInWithOtp({
    email: 'valid.email@supabase.io',
    options: {
      // set this to false if you do not want the user to be automatically signed up
      shouldCreateUser: false,
      emailRedirectTo: 'https://example.com/welcome',
    },
  })
}
```

---

TITLE: Starting Supabase Locally with CLI
DESCRIPTION: Provides the command to start a local Supabase instance using the Supabase CLI. This allows users to try out the PostgREST 11 pre-release features in a local development environment. It's a prerequisite for testing the new querying capabilities discussed in the article.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-12-16-postgrest-11-prerelease.mdx#_snippet_5

LANGUAGE: bash
CODE:

```
$ supabase start
```

---

TITLE: Seeding Supabase with Video Embeddings using Mixpeek
DESCRIPTION: This Python function `seed` initializes Supabase and Mixpeek clients, creates a `video_chunks` table in Supabase, processes a video into chunks using Mixpeek, generates embeddings for each chunk, and inserts them into the Supabase table. Finally, it creates an IVFFlat index on the `embedding` column for efficient vector similarity search.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/examples/mixpeek-video-search.mdx#_snippet_6

LANGUAGE: python
CODE:

```
def seed():
    # Initialize Supabase and Mixpeek clients
    supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)
    mixpeek = Mixpeek(MIXPEEK_API_KEY)

    # Create a table for storing video chunk embeddings
    supabase.table("video_chunks").create({
        "id": "text",
        "start_time": "float8",
        "end_time": "float8",
        "embedding": "vector(768)",
        "metadata": "jsonb"
    })

    # Process and embed video
    video_url = "https://example.com/your_video.mp4"
    processed_chunks = mixpeek.tools.video.process(
        video_source=video_url,
        chunk_interval=1,  # 1 second intervals
        resolution=[720, 1280]
    )

    for chunk in processed_chunks:
        print(f"Processing video chunk: {chunk['start_time']}")

        # Generate embedding using Mixpeek
        embed_response = mixpeek.embed.video(
            model_id="vuse-generic-v1",
            input=chunk['base64_chunk'],
            input_type="base64"
        )

        # Insert into Supabase
        supabase.table("video_chunks").insert({
            "id": f"chunk_{chunk['start_time']}",
            "start_time": chunk["start_time"],
            "end_time": chunk["end_time"],
            "embedding": embed_response['embedding'],
            "metadata": {"video_url": video_url}
        }).execute()

    print("Video processed and embeddings inserted")

    # Create index for fast search performance
    supabase.query("CREATE INDEX ON video_chunks USING ivfflat (embedding vector_cosine_ops) WITH (lists = 100)").execute()
    print("Created index")
```

---

TITLE: Querying CLIP Embeddings from Supabase Vector Database - Python
DESCRIPTION: This Python code shows how to query the Supabase vector database for similar images based on a text query. It first calculates the CLIP embedding for a given text (e.g., "cat") using the Roboflow Inference server, then uses this embedding to query the `image_vectors` collection in Supabase to find the most similar image.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/integrations/roboflow.mdx#_snippet_7

LANGUAGE: Python
CODE:

```
infer_clip_payload = {
    "text": "cat"
}

res = requests.post(
    f"{SERVER_URL}/clip/embed_text?api_key={API_KEY}",
    json=infer_clip_payload
)

embeddings = res.json()['embeddings']

result = images.query(
    data=embeddings[0],
    limit=1
)

print(result[0])
```

---

TITLE: Implementing Simple Similarity Search with Supabase Edge Function (TypeScript)
DESCRIPTION: This Edge Function performs a basic similarity search. It takes a query, generates an OpenAI embedding for it, and then uses a Supabase RPC call (`match_documents`) to find the most similar documents based on a specified threshold and count. It handles CORS preflight requests and returns the matched documents as JSON.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-02-03-openai-embeddings-postgres-vector.mdx#_snippet_5

LANGUAGE: TypeScript
CODE:

```
import { serve } from 'https://deno.land/std@0.170.0/http/server.ts'
import 'https://deno.land/x/xhr@0.2.1/mod.ts'
import { createClient } from 'jsr:@supabase/supabase-js@2'
import { Configuration, OpenAIApi } from 'https://esm.sh/openai@3.1.0'
import { supabaseClient } from './lib/supabase'

export const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  // Handle CORS
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  // Search query is passed in request payload
  const { query } = await req.json()

  // OpenAI recommends replacing newlines with spaces for best results
  const input = query.replace(/\n/g, ' ')

  const configuration = new Configuration({ apiKey: '<YOUR_OPENAI_API_KEY>' })
  const openai = new OpenAIApi(configuration)

  // Generate a one-time embedding for the query itself
  const embeddingResponse = await openai.createEmbedding({
    model: 'text-embedding-ada-002',
    input,
  })

  const [{ embedding }] = embeddingResponse.data.data

  // In production we should handle possible errors
  const { data: documents } = await supabaseClient.rpc('match_documents', {
    query_embedding: embedding,
    match_threshold: 0.78, // Choose an appropriate threshold for your data
    match_count: 10, // Choose the number of matches
  })

  return new Response(JSON.stringify(documents), {
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
  })
})
```

---

TITLE: Configuring Prisma Database Connection in .env (Text)
DESCRIPTION: This snippet demonstrates how to configure the DATABASE_URL and DIRECT_URL variables in the .env file for Prisma, using Supabase connection strings. It covers both server-based deployments (session mode) and serverless deployments (transaction mode with pgbouncer=true and a separate DIRECT_URL for migrations).
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/prisma.mdx#_snippet_2

LANGUAGE: text
CODE:

```
# Used for Prisma Migrations and within your application
DATABASE_URL="postgres://[DB-USER].[PROJECT-REF]:[PRISMA-PASSWORD]@[DB-REGION].pooler.supabase.com:5432/postgres"
```

LANGUAGE: md
CODE:

```
postgres://prisma.[PROJECT-REF]...
```

LANGUAGE: text
CODE:

```
# Used in your application (use transaction mode)
DATABASE_URL="postgres://[DB-USER].[PROJECT-REF]:[PRISMA-PASSWORD]@aws-0-us-east-1.pooler.supabase.com:6543/postgres?pgbouncer=true"

# Used for Prisma Migrations (use session mode or direct connection)
DIRECT_URL="postgres://[DB-USER].[PROJECT-REF]:[PRISMA-PASSWORD]@aws-0-us-east-1.pooler.supabase.com:5432/postgres"
```

LANGUAGE: md
CODE:

```
postgres://prisma.[PROJECT-REF]...
```

LANGUAGE: text
CODE:

```
datasource db {
  provider  = "postgresql"
  url       = env("DATABASE_URL")
  directUrl = env("DIRECT_URL")
}
```

---

TITLE: Implement React Native Authentication Component
DESCRIPTION: Develop a `components/Auth.tsx` React Native component to handle user sign-in and sign-up functionalities. This component uses `useState` for email and password inputs, `supabase.auth.signInWithPassword` and `supabase.auth.signUp` for authentication, and displays alerts for errors or verification messages.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/quickstarts/react-native.mdx#_snippet_4

LANGUAGE: tsx
CODE:

```
import React, { useState } from 'react'
import { Alert, StyleSheet, View } from 'react-native'
import { supabase } from '../lib/supabase'
import { Button, Input } from '@rneui/themed'

export default function Auth() {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [loading, setLoading] = useState(false)

  async function signInWithEmail() {
    setLoading(true)
    const { error } = await supabase.auth.signInWithPassword({
      email: email,
      password: password,
    })

    if (error) Alert.alert(error.message)
    setLoading(false)
  }

  async function signUpWithEmail() {
    setLoading(true)
    const {
      data: { session },
      error,
    } = await supabase.auth.signUp({
      email: email,
      password: password,
    })

    if (error) Alert.alert(error.message)
    if (!session) Alert.alert('Please check your inbox for email verification!')
    setLoading(false)
  }

  return (
    <View style={styles.container}>
      <View style={[styles.verticallySpaced, styles.mt20]}>
        <Input
          label="Email"
          leftIcon={{ type: 'font-awesome', name: 'envelope' }}
          onChangeText={(text) => setEmail(text)}
          value={email}
```

---

TITLE: Implementing Smarter Search with GPT-3 Context Injection in Supabase Edge Function (TypeScript)
DESCRIPTION: This advanced Edge Function extends the simple search by integrating OpenAI's GPT-3 completion model. It first performs a similarity search to retrieve relevant documents, then tokenizes and concatenates these documents to form a context. This context, along with the user's query, is used to construct a prompt for GPT-3, which then generates a cohesive answer. It also handles CORS and token limits for the context.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-02-03-openai-embeddings-postgres-vector.mdx#_snippet_6

LANGUAGE: TypeScript
CODE:

```
import { serve } from 'https://deno.land/std@0.170.0/http/server.ts'
import 'https://deno.land/x/xhr@0.2.1/mod.ts'
import { createClient } from 'jsr:@supabase/supabase-js@2'
import GPT3Tokenizer from 'https://esm.sh/gpt3-tokenizer@1.1.5'
import { Configuration, OpenAIApi } from 'https://esm.sh/openai@3.1.0'
import { oneLine, stripIndent } from 'https://esm.sh/common-tags@1.8.2'
import { supabaseClient } from './lib/supabase'

export const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  // Handle CORS
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  // Search query is passed in request payload
  const { query } = await req.json()

  // OpenAI recommends replacing newlines with spaces for best results
  const input = query.replace(/\n/g, ' ')

  const configuration = new Configuration({ apiKey: '<YOUR_OPENAI_API_KEY>' })
  const openai = new OpenAIApi(configuration)

  // Generate a one-time embedding for the query itself
  const embeddingResponse = await openai.createEmbedding({
    model: 'text-embedding-ada-002',
    input,
  })

  const [{ embedding }] = embeddingResponse.data.data

  // Fetching whole documents for this simple example.
  //
  // Ideally for context injection, documents are chunked into
  // smaller sections at earlier pre-processing/embedding step.
  const { data: documents } = await supabaseClient.rpc('match_documents', {
    query_embedding: embedding,
    match_threshold: 0.78, // Choose an appropriate threshold for your data
    match_count: 10, // Choose the number of matches
  })

  const tokenizer = new GPT3Tokenizer({ type: 'gpt3' })
  let tokenCount = 0
  let contextText = ''

  // Concat matched documents
  for (let i = 0; i < documents.length; i++) {
    const document = documents[i]
    const content = document.content
    const encoded = tokenizer.encode(content)
    tokenCount += encoded.text.length

    // Limit context to max 1500 tokens (configurable)
    if (tokenCount > 1500) {
      break
    }

    contextText += `${content.trim()}\n---\n`
  }

  const prompt = stripIndent`${oneLine`\n    You are a very enthusiastic Supabase representative who loves\n    to help people! Given the following sections from the Supabase\n    documentation, answer the question using only that information,\n    outputted in markdown format. If you are unsure and the answer\n    is not explicitly written in the documentation, say\n    "Sorry, I don't know how to help with that."`}\n\n    Context sections:\n    ${contextText}\n\n    Question: """\n    ${query}\n    """\n\n    Answer as markdown (including related code snippets if available):\n  `

  // In production we should handle possible errors
  const completionResponse = await openai.createCompletion({
    model: 'text-davinci-003',
    prompt,
    max_tokens: 512, // Choose the max allowed tokens in completion
    temperature: 0, // Set to 0 for deterministic results
  })

  const {
    id,
    choices: [{ text }],
  } = completionResponse.data

  return new Response(JSON.stringify({ id, text }), {
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
  })
})
```

---

TITLE: Defining Todo Table Schema and Row Level Security Policies
DESCRIPTION: This SQL snippet defines the `todos` table schema, including columns for `id`, `user_id`, `task`, `is_complete`, and `inserted_at`. It then enables Row Level Security (RLS) and defines policies to ensure users can only create, view, update, and delete their own todo items based on their `auth.uid()`.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/todo-list/nextjs-todo-list/README.md#_snippet_1

LANGUAGE: SQL
CODE:

```
create table todos (
  id bigint generated by default as identity primary key,
  user_id uuid references auth.users not null,
  task text check (char_length(task) > 3),
  is_complete boolean default false,
  inserted_at timestamp with time zone default timezone('utc'::text, now()) not null
);

alter table todos enable row level security;

create policy "Individuals can create todos." on todos for
    insert with check ((select auth.uid()) = user_id);

create policy "Individuals can view their own todos. " on todos for
    select using ((select auth.uid()) = user_id);

create policy "Individuals can update their own todos." on todos for
    update using ((select auth.uid()) = user_id);

create policy "Individuals can delete their own todos." on todos for
    delete using ((select auth.uid()) = user_id);
```

---

TITLE: Creating Adaptive Retrieval Match Function in Postgres
DESCRIPTION: This SQL function, `match_documents_adaptive`, implements a two-pass adaptive retrieval strategy. It first shortlists documents using a 512-dimension sub-vector for an initial fast pass, then re-ranks the shortlist using the full 3072-dimension embedding for final, more accurate results.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-02-13-matryoshka-embeddings.mdx#_snippet_14

LANGUAGE: SQL
CODE:

```
create or replace function match_documents_adaptive(
  query_embedding extensions.vector(3072),
  match_count int
)
returns setof public.documents
language sql
set search_path = ''
as $$
with shortlist as (
  select *
  from public.documents
  order by
    public.sub_vector(embedding, 512)::extensions.vector(512) operator(extensions.<#>) (
      select public.sub_vector(query_embedding, 512)::extensions.vector(512)
    ) asc
  limit match_count * 8
)
select *
from shortlist
order by embedding operator(extensions.<#>) query_embedding asc
limit least(match_count, 200);
$$;
```

---

TITLE: Supabase User Profiles and Storage Schema
DESCRIPTION: This SQL script defines the `profiles` table with RLS (Row Level Security) policies for public viewing, user insertion, and user updates. It also sets up Realtime for the `profiles` table and configures an `avatars` storage bucket with public access policies for uploads and selects, ensuring secure and accessible data management.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/user-management/nuxt3-user-management/README.md#_snippet_1

LANGUAGE: sql
CODE:

```
-- Create a table for public "profiles"
create table profiles (
  id uuid references auth.users not null,
  updated_at timestamp with time zone,
  username text unique,
  avatar_url text,
  website text,

  primary key (id),
  unique(username),
  constraint username_length check (char_length(username) >= 3)
);

alter table profiles enable row level security;

create policy "Public profiles are viewable by everyone."
  on profiles for select
  using ( true );

create policy "Users can insert their own profile."
  on profiles for insert
  with check ( (select auth.uid()) = id );

create policy "Users can update own profile."
  on profiles for update
  using ( (select auth.uid()) = id );

-- Set up Realtime!
begin;
  drop publication if exists supabase_realtime;
  create publication supabase_realtime;
commit;
alter publication supabase_realtime add table profiles;

-- Set up Storage!
insert into storage.buckets (id, name)
values ('avatars', 'avatars');

create policy "Avatar images are publicly accessible."
  on storage.objects for select
  using ( bucket_id = 'avatars' );

create policy "Anyone can upload an avatar."
  on storage.objects for insert
  with check ( bucket_id = 'avatars' );
```

---

TITLE: Handling Supabase Auth Code Exchange in Next.js Route Handler (JavaScript)
DESCRIPTION: This JavaScript Route Handler (`GET` method) at `app/auth/callback` is responsible for exchanging an authentication `code` for a user session. It uses `createRouteHandlerClient` to create a Supabase client with access to cookies, then calls `exchangeCodeForSession` to set the user's session as a cookie, finally redirecting the user back to the application's origin.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs.mdx#_snippet_4

LANGUAGE: js
CODE:

```
import { createRouteHandlerClient } from '@supabase/auth-helpers-nextjs'
import { cookies } from 'next/headers'
import { NextResponse } from 'next/server'

export async function GET(request) {
  const requestUrl = new URL(request.url)
  const code = requestUrl.searchParams.get('code')

  if (code) {
    const cookieStore = cookies()
    const supabase = createRouteHandlerClient({ cookies: () => cookieStore })
    await supabase.auth.exchangeCodeForSession(code)
  }

  // URL to redirect to after sign in process completes
  return NextResponse.redirect(requestUrl.origin)
}
```

---

TITLE: Enforcing MFA for Selected Users with RLS - SQL
DESCRIPTION: A PostgreSQL Row Level Security (RLS) policy designed to enforce MFA only for users who have enabled it. This policy allows access if the user has completed MFA (`aal2`) or if they have no verified MFA factors, providing flexibility while ensuring security for those who opt-in.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-12-14-mfa-auth-via-rls.mdx#_snippet_3

LANGUAGE: sql
CODE:

```
create policy "Allow access on table only if user has gone through MFA"
  on table_name
  as restrictive -- very important!
  to authenticated
  using (
    array[auth.jwt()->>'aal'] <@ (
      select
          case
            when count(id) > 0 then array['aal2']
            else array['aal1', 'aal2']
          end as aal
        from auth.mfa_factors
        where (select auth.uid()) = user_id and status = 'verified'
    ));
```

---

TITLE: Implementing Authentication Repository with Supabase in Kotlin
DESCRIPTION: This class provides the concrete implementation of the `AuthenticationRepository` interface, utilizing Supabase's Auth client. It includes methods for email/password sign-in/sign-up and Google sign-in, handling potential exceptions.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-kotlin.mdx#_snippet_15

LANGUAGE: kotlin
CODE:

```
class AuthenticationRepositoryImpl @Inject constructor(
    private val auth: Auth
) : AuthenticationRepository {
    override suspend fun signIn(email: String, password: String): Boolean {
        return try {
            auth.signInWith(Email) {
                this.email = email
                this.password = password
            }
            true
        } catch (e: Exception) {
            false
        }
    }

    override suspend fun signUp(email: String, password: String): Boolean {
        return try {
            auth.signUpWith(Email) {
                this.email = email
                this.password = password
            }
            true
        } catch (e: Exception) {
            false
        }
    }

    override suspend fun signInWithGoogle(): Boolean {
        return try {
            auth.signInWith(Google)
            true
        } catch (e: Exception) {
            false
        }
    }
}
```

---

TITLE: Streaming Large Language Model Responses in Supabase Edge Functions (TypeScript)
DESCRIPTION: This code illustrates how to integrate Large Language Models (LLMs) like 'mistral' into a Supabase Edge Function, handling streaming responses. It sets up a Deno server to accept a prompt via a query string, runs the LLM with streaming enabled, and returns the generated text as a Server-Sent Event (SSE) stream, ideal for real-time conversational AI applications.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-04-16-ai-inference-now-available-in-supabase-edge-functions.mdx#_snippet_1

LANGUAGE: TypeScript
CODE:

```
const session = new Supabase.ai.Session('mistral')

Deno.serve(async (req: Request) => {
  // Get the prompt from the query string
  const params = new URL(req.url).searchParams
  const prompt = params.get('prompt') ?? ''

  // Get the output as a stream
  const output = await session.run(prompt, { stream: true })

  // Create a stream
  const stream = new ReadableStream({
    async start(controller) {
      const encoder = new TextEncoder()
      for await (const chunk of output) {
        controller.enqueue(encoder.encode(chunk.response ?? ''))
      }
    }
  })

  // Return the stream to the user
  return new Response(stream, {
    headers: new Headers({
      'Content-Type': 'text/event-stream',
      Connection: 'keep-alive'
    })
  })
})
```

---

TITLE: Analyzing Query Performance with EXPLAIN ANALYZE in PostgreSQL
DESCRIPTION: This SQL command uses `EXPLAIN (ANALYZE)` to show the execution plan and actual runtime statistics for a `SELECT` query. It helps in understanding how PostgreSQL's query planner executes a query, identifying performance bottlenecks, and verifying the effectiveness of indexes.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2021-02-27-cracking-postgres-interview.mdx#_snippet_2

LANGUAGE: SQL
CODE:

```
EXPLAIN (ANALYZE) SELECT *
FROM students
WHERE surname = 'Krobb';
```

---

TITLE: Enforcing MFA with Supabase Row Level Security Policy
DESCRIPTION: This SQL Row Level Security (RLS) policy enforces Multi-Factor Authentication (MFA) for all authenticated users accessing a specific table. It uses a `restrictive` policy to ensure that only sessions with an Authenticator Assurance Level (AAL) of `aal2` (indicating MFA verification) are granted access. This policy should be applied to tables where access requires a higher level of identity assurance.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-mfa.mdx#_snippet_2

LANGUAGE: SQL
CODE:

```
create policy "Policy name."
  on table_name
  as restrictive
  to authenticated
  using ((select auth.jwt()->>'aal') = 'aal2');
```

---

TITLE: Optimized Supabase Client Query with Explicit Filter in JavaScript
DESCRIPTION: This JavaScript code snippet demonstrates an optimized Supabase client query that selects data from a table and explicitly filters by `user_id`. Even when RLS policies are in place, adding an explicit filter like `.eq('user_id', userId)` allows PostgreSQL to create a more efficient query plan, significantly improving performance.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/row-level-security.mdx#_snippet_18

LANGUAGE: JavaScript
CODE:

```
const { data } = supabase
  .from('table')
  .select()
  .eq('user_id', userId)
```

---

TITLE: Revoking Function Execution Privilege from Public Role in PostgreSQL
DESCRIPTION: This snippet shows the 'postgres' superuser revoking the 'execute' privilege on the 'add' function from the 'public' role. This is the crucial step to prevent all roles, including 'junior_dev', from executing the function if they don't have explicit grants.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-04-11-postgres-roles-and-privileges.mdx#_snippet_48

LANGUAGE: bash
CODE:

```
# as postgres
postgres=> revoke execute on function add(integer, integer) from public;
REVOKE
```

---

TITLE: Creating Supabase database tables
DESCRIPTION: This SQL script defines two tables: `profiles` to store user information (linked to `auth.users`) and `messages` to store chat content (linked to `profiles`). It includes constraints for username validation and sets up default values and foreign key relationships.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-06-30-flutter-tutorial-building-a-chat-app.mdx#_snippet_3

LANGUAGE: sql
CODE:

```
create table if not exists public.profiles (
    id uuid references auth.users on delete cascade not null primary key,
    username varchar(24) not null unique,
    created_at timestamp with time zone default timezone('utc' :: text, now()) not null,

    -- username should be 3 to 24 characters long containing alphabets, numbers and underscores
    constraint username_validation check (username ~* '^[A-Za-z0-9_]{3,24}$')
);
comment on table public.profiles is 'Holds all of users profile information';

create table if not exists public.messages (
    id uuid not null primary key default gen_random_uuid(),
    profile_id uuid default auth.uid() references public.profiles(id) on delete cascade not null,
    content varchar(500) not null,
    created_at timestamp with time zone default timezone('utc' :: text, now()) not null
);
comment on table public.messages is 'Holds individual messages sent on the app.';
```

---

TITLE: Injecting Supabase TypeScript Types into Client
DESCRIPTION: This TypeScript snippet imports the Database types generated by the Supabase CLI and injects them into the createClient function. This enables type inference and safety for all Supabase queries and operations within the application, ensuring data consistency and reducing errors.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-09-23-local-first-expo-legend-state.mdx#_snippet_8

LANGUAGE: typescript
CODE:

```
import { createClient } from '@supabase/supabase-js'
import { Database } from './database.types'
// [...]

const supabase = createClient<Database>(
  process.env.EXPO_PUBLIC_SUPABASE_URL,
  process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY
)

// [...]
```

---

TITLE: Analyzing Query Plan with EXPLAIN in Postgres
DESCRIPTION: This SQL command uses the `EXPLAIN` statement to show the execution plan for a query. It helps identify performance bottlenecks by detailing how Postgres will execute the query, including operations like sequential scans and their associated costs, aiding in optimization decisions.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/query-optimization.mdx#_snippet_4

LANGUAGE: SQL
CODE:

```
explain select * from customers where sign_up_date > 25;
```

---

TITLE: Processing Zip Files with Background Tasks and Ephemeral Storage - JavaScript
DESCRIPTION: This snippet provides an improved approach for handling large zip files by utilizing Supabase Edge Functions' background tasks and ephemeral storage. It first writes the incoming zip file to a temporary location (`/tmp/`) using `Deno.writeFile`. Then, it offloads the extraction and upload process to a background task using `EdgeRuntime.waitUntil`, ensuring the function doesn't terminate until the processing is complete. This method reduces memory consumption by reading parts of the zip file from disk. It also includes a `beforeunload` event listener for logging.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-12-03-edge-functions-background-tasks-websockets.mdx#_snippet_1

LANGUAGE: JavaScript
CODE:

```
import { BlobWriter, ZipReader, ZipReaderStream } from 'https://deno.land/x/zipjs/index.js'

import { createClient } from 'jsr:@supabase/supabase-js@2'

const supabase = createClient(
  Deno.env.get('SUPABASE_URL'),
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')
)

let numFilesUploaded = 0

async function processZipFile(uploadId, filepath) {
  const file = await Deno.open(filepath, { read: true })
  const zipReader = new ZipReader(file.readable)
  const entries = await zipReader.getEntries()

  await supabase.storage.createBucket(uploadId, {
    public: false,
  })

  await Promise.all(
    entries.map(async (entry) => {
      // read file entry
      const blobWriter = new BlobWriter()
      const blob = await entry.getData(blobWriter)

      if (entry.directory) {
        return
      }

      // write file to Supabase Storage
      await supabase.storage.from(uploadId).upload(entry.filename, blob, {})

      numFilesUploaded += 1
      console.log('uploaded', entry.filename)
    })
  )

  await zipReader.close()
}

// you can add a `beforeunload` event listener to be notified
// when Function Worker is about to terminate.
// use this to do any logging, save states.
globalThis.addEventListener('beforeunload', (ev) => {
  console.log('function about to terminate: ', ev.detail.reason)
  console.log('number of files uploaded: ', numFilesUploaded)
})

async function writeZipFile(filepath, stream) {
  await Deno.writeFile(filepath, stream)
}

Deno.serve(async (req) => {
  const uploadId = crypto.randomUUID()
  await writeZipFile('/tmp/' + uploadId, req.body)

  // process zip file in a background task
  // calling EdgeRuntime.waitUntil() would ensure
  // function worker wouldn't exit until the promise is completed.
  EdgeRuntime.waitUntil(processZipFile(uploadId, '/tmp/' + uploadId))

  return new Response(
    JSON.stringify({
      uploadId,
    }),
    {
      headers: {
        'content-type': 'application/json',
      },
    }
  )
})
```

---

TITLE: Querying One-to-Many Join with Supabase in Swift
DESCRIPTION: This Swift snippet demonstrates querying a one-to-many relationship with Supabase, including `Codable` structs to map the nested `instruments` data directly into Swift objects for type-safe handling.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/joins-and-nesting.mdx#_snippet_5

LANGUAGE: Swift
CODE:

```
struct OrchestralSection: Codable {
  let id: Int
  let name: String
  let instruments: [Instrument]

  struct Instrument: Codable {
    let id: Int
    let name: String
  }
}

let orchestralSections: [OrchestralSection] = try await supabase
  .from("orchestral_sections")
  .select("id, name, instruments(id, name)")
  .execute()
  .value
```

---

TITLE: Install Supabase packages for Next.js
DESCRIPTION: Installs the @supabase/supabase-js and @supabase/ssr packages. These are essential dependencies for integrating Supabase authentication into your Next.js project.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/server-side/nextjs.mdx#_snippet_0

LANGUAGE: sh
CODE:

```
npm install @supabase/supabase-js @supabase/ssr
```

---

TITLE: Linking Anonymous User to Existing Account - JavaScript
DESCRIPTION: This JavaScript snippet demonstrates how to link an anonymous Supabase user to an existing permanent account. It involves attempting to update the anonymous user's email, catching the conflict error, signing into the existing account, reassigning data associated with the anonymous user to the permanent user, and finally resolving any data conflicts using a custom `resolveDataConflicts` function. This process requires the Supabase JS client.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-anonymous.mdx#_snippet_16

LANGUAGE: JavaScript
CODE:

```
// 1. Sign in anonymously (assuming the user is already signed in anonymously)
const { data: anonData, error: anonError } = await supabase.auth.getSession()

// 2. Attempt to update the user with the existing email
const { data: updateData, error: updateError } = await supabase.auth.updateUser({
  email: 'valid.email@supabase.io',
})

// 3. Handle the error (since the email belongs to an existing user)
if (updateError) {
  console.log('This email belongs to an existing user. Please sign in to that account.')

  // 4. Sign in to the existing account
  const {
    data: { user: existingUser },
    error: signInError,
  } = await supabase.auth.signInWithPassword({
    email: 'valid.email@supabase.io',
    password: 'user_password',
  })

  if (existingUser) {
    // 5. Reassign entities tied to the anonymous user
    // This step will vary based on your specific use case and data model
    const { data: reassignData, error: reassignError } = await supabase
      .from('your_table')
      .update({ user_id: existingUser.id })
      .eq('user_id', anonData.session.user.id)

    // 6. Implement your chosen conflict resolution strategy
    // This could involve merging data, overwriting, or other custom logic
    await resolveDataConflicts(anonData.session.user.id, existingUser.id)
  }
}

// Helper function to resolve data conflicts (implement based on your strategy)
async function resolveDataConflicts(anonymousUserId, existingUserId) {
  // Implement your conflict resolution logic here
  // This could involve ignoring the anonymous user's metadata, overwriting the existing user's metadata, or merging the data of both the anonymous and existing user.
}
```

---

TITLE: Computing Routes with Google Maps API in a Supabase Edge Function
DESCRIPTION: This TypeScript Deno function serves as an Edge Function to compute routes between an origin and destination using the Google Maps Directions API. It handles incoming JSON requests, makes a POST request to the Google API, and returns the route details, including duration, distance, and polyline.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-09-05-flutter-uber-clone.mdx#_snippet_11

LANGUAGE: TypeScript
CODE:

```
type Coordinates = {
  latitude: number
  longitude: number
}

Deno.serve(async (req) => {
  const {
    origin,
    destination,
  }: {
    origin: Coordinates
    destination: Coordinates
  } = await req.json()

  const response = await fetch(
    `https://routes.googleapis.com/directions/v2:computeRoutes?key=${Deno.env.get(
      'GOOGLE_MAPS_API_KEY'
    )}`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-FieldMask':
          'routes.duration,routes.distanceMeters,routes.polyline,routes.legs.polyline',
      },
      body: JSON.stringify({
        origin: { location: { latLng: origin } },
        destination: { location: { latLng: destination } },
        travelMode: 'DRIVE',
        polylineEncoding: 'GEO_JSON_LINESTRING',
      }),
    }
  )

  if (!response.ok) {
    const error = await response.json()
    console.error({ error })
    throw new Error(`HTTP error! status: ${response.status}`)
  }

  const data = await response.json()

  const res = data.routes[0]

  return new Response(JSON.stringify(res), { headers: { 'Content-Type': 'application/json' } })
})
```

---

TITLE: Reindexing a Specific Index Concurrently - PostgreSQL
DESCRIPTION: Rebuilds the `idx_persons_age` index concurrently, meaning it does not block writes to the table during the reindexing process. This is crucial for maintaining application availability on production systems with large datasets.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/indexes.mdx#_snippet_6

LANGUAGE: SQL
CODE:

```
reindex index concurrently idx_persons_age;
```

---

TITLE: Adding Internet Permission to AndroidManifest.xml
DESCRIPTION: This XML snippet shows how to declare the `INTERNET` permission in the `AndroidManifest.xml` file. This permission is crucial for the Android application to perform network requests, which are required for communicating with the Supabase backend. It must be placed under the `manifest` tag and outside the `application` tag.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/quickstarts/kotlin.mdx#_snippet_1

LANGUAGE: xml
CODE:

```
...
<uses-permission android:name="android.permission.INTERNET" />
...
```

---

TITLE: Next.js Server Component for Supabase User Authentication
DESCRIPTION: This snippet illustrates a Next.js server component that integrates with Supabase to verify user authentication. It fetches the user session and, if the user is not authenticated or an error occurs, redirects them to the '/login' page. Authenticated users are greeted with their email.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/server-side/nextjs.mdx#_snippet_9

LANGUAGE: TypeScript
CODE:

```
import { redirect } from 'next/navigation'

import { createClient } from '@/utils/supabase/server'

export default async function PrivatePage() {
  const supabase = await createClient()

  const { data, error } = await supabase.auth.getUser()
  if (error || !data?.user) {
    redirect('/login')
  }

  return <p>Hello {data.user.email}</p>
}
```

---

TITLE: Calculating Hypothetical Max Connections Based on Memory
DESCRIPTION: This SQL query provides a formula to estimate a hypothetical maximum `max_connections` value based on your server's available memory and current PostgreSQL configuration parameters like `shared_buffers`, `autovacuum_max_workers`, `maintenance_work_mem`, and `work_mem`. This helps in understanding the memory limits before increasing direct connections.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/how-to-change-max-database-connections-_BQ8P5.mdx#_snippet_2

LANGUAGE: sql
CODE:

```
select
  '(SERVER MEMORY - ' || current_setting('shared_buffers') || ' - (' || current_setting(
    'autovacuum_max_workers'
  ) || ' * ' || current_setting('maintenance_work_mem') || ')) / ' || current_setting('work_mem');
```

---

TITLE: Registering Supabase Protocol for MapLibre GL
DESCRIPTION: This JavaScript code defines a custom `supabase` protocol for MapLibre GL, enabling it to fetch vector tiles via Supabase. It uses `supabase-js` to make an RPC call to the `mvt` Postgres function, retrieves base64-encoded tile data, and converts it to an ArrayBuffer for MapLibre GL to render.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-06-26-postgis-generate-vector-tiles.mdx#_snippet_6

LANGUAGE: javascript
CODE:

```
const client = supabase.createClient('your-supabase-api-url', 'your-supabase-anon-key')

function base64ToArrayBuffer(base64) {
  var binaryString = atob(base64)
  var bytes = new Uint8Array(binaryString.length)
  for (var i = 0; i < binaryString.length; i++) {
    bytes[i] = binaryString.charCodeAt(i)
  }
  return bytes
}

maplibregl.addProtocol('supabase', async (params, abortController) => {
  const re = new RegExp(/supabase:\/\/(.+)\/(\d+)\/(\d+)\/(\d+)/)
  const result = params.url.match(re)
  const { data, error } = await client.rpc('mvt', {
    z: result[2],
    x: result[3],
    y: result[4]
  })
  const encoded = base64ToArrayBuffer(data)
  if (!error) {
    return { data: encoded }
  } else {
    throw new Error(`Tile fetch error:`)
  }
})
```

---

TITLE: Managing Supabase Database Migrations with CLI
DESCRIPTION: This snippet details the `supabase migration` CLI command, which is used to manage database migration scripts. It lists available subcommands such as `list`, `new`, `repair`, `squash`, and `up`, enabling developers to control their database schema versions through SQL files.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-08-08-supabase-local-dev.mdx#_snippet_2

LANGUAGE: markdown
CODE:

```
supabase migration
Manage database migration scripts

Usage:
  supabase migration [command]

Available Commands:
  list        List local and remote migrations
  new         Create an empty migration script
  repair      Repair the migration history table
  squash      Squash migrations to a single file
  up          Apply pending migrations to local database
```

---

TITLE: Configuring Server-Side Supabase Hooks in SvelteKit (TypeScript)
DESCRIPTION: This TypeScript snippet demonstrates setting up server-side hooks in `src/hooks.server.ts`. It creates a request-specific Supabase client that uses cookies for authentication, includes a `safeGetSession` function to validate user JWTs, and implements an `authGuard` to protect routes and redirect unauthenticated users or authenticated users from login pages.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/server-side/sveltekit.mdx#_snippet_2

LANGUAGE: ts
CODE:

```
import { createServerClient } from '@supabase/ssr'
import { type Handle, redirect } from '@sveltejs/kit'
import { sequence } from '@sveltejs/kit/hooks'

import { PUBLIC_SUPABASE_URL, PUBLIC_SUPABASE_ANON_KEY } from '$env/static/public'

const supabase: Handle = async ({ event, resolve }) => {
  /**
   * Creates a Supabase client specific to this server request.
   *
   * The Supabase client gets the Auth token from the request cookies.
   */
  event.locals.supabase = createServerClient(PUBLIC_SUPABASE_URL, PUBLIC_SUPABASE_ANON_KEY, {
    cookies: {
      getAll: () => event.cookies.getAll(),
      /**
       * SvelteKit's cookies API requires `path` to be explicitly set in
       * the cookie options. Setting `path` to `/` replicates previous/
       * standard behavior.
       */
      setAll: (cookiesToSet) => {
        cookiesToSet.forEach(({ name, value, options }) => {
          event.cookies.set(name, value, { ...options, path: '/' })
        })
      }
    }
  })

  /**
   * Unlike `supabase.auth.getSession()`, which returns the session _without_
   * validating the JWT, this function also calls `getUser()` to validate the
   * JWT before returning the session.
   */
  event.locals.safeGetSession = async () => {
    const {
      data: { session }
    } = await event.locals.supabase.auth.getSession()
    if (!session) {
      return { session: null, user: null }
    }

    const {
      data: { user },
      error
    } = await event.locals.supabase.auth.getUser()
    if (error) {
      // JWT validation has failed
      return { session: null, user: null }
    }

    return { session, user }
  }

  return resolve(event, {
    filterSerializedResponseHeaders(name) {
      /**
       * Supabase libraries use the `content-range` and `x-supabase-api-version`
       * headers, so we need to tell SvelteKit to pass it through.
       */
      return name === 'content-range' || name === 'x-supabase-api-version'
    }
  })
}

const authGuard: Handle = async ({ event, resolve }) => {
  const { session, user } = await event.locals.safeGetSession()
  event.locals.session = session
  event.locals.user = user

  if (!event.locals.session && event.url.pathname.startsWith('/private')) {
    redirect(303, '/auth')
  }

  if (event.locals.session && event.url.pathname === '/auth') {
    redirect(303, '/private')
  }

  return resolve(event)
}

export const handle: Handle = sequence(supabase, authGuard)
```

---

TITLE: Create RLS Policy for Owner-Only Updates (SQL)
DESCRIPTION: This SQL policy for PostgreSQL's Row Level Security (RLS) restricts `UPDATE` operations on the `posts` table. It ensures that only the user who created a post (identified by `auth.uid()`) can update it, effectively acting as a `WHERE` clause for all update queries.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/column-level-security.mdx#_snippet_0

LANGUAGE: sql
CODE:

```
create policy "Allow update for owners" on posts for
update
  using ((select auth.uid()) = user_id);
```

---

TITLE: Signing Out from Supabase Auth in JavaScript
DESCRIPTION: This JavaScript snippet shows how to sign out a user from their current session using `supabase.auth.signOut()`. This action removes the user's session from the browser and clears any related data from local storage.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/social-login/auth-spotify.mdx#_snippet_3

LANGUAGE: JavaScript
CODE:

```
import { createClient } from '@supabase/supabase-js'
const supabase = createClient('<your-project-url>', '<your-anon-key>')

// ---cut---
async function signOut() {
  const { error } = await supabase.auth.signOut()
}
```

---

TITLE: Implementing TOTP MFA Enrollment in React
DESCRIPTION: This React component, `EnrollMFA`, facilitates the TOTP MFA enrollment process. It initiates enrollment by calling `supabase.auth.mfa.enroll()` to retrieve a QR code and factor ID. The QR code is then displayed for the user to scan with their authenticator app. Once the user enters a verification code, the component uses `supabase.auth.mfa.challenge()` and `supabase.auth.mfa.verify()` to validate the code and activate the MFA factor, handling errors and providing callbacks for completion or cancellation.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-mfa/totp.mdx#_snippet_0

LANGUAGE: tsx
CODE:

```
/**
 * EnrollMFA shows a simple enrollment dialog. When shown on screen it calls
 * the `enroll` API. Each time a user clicks the Enable button it calls the
 * `challenge` and `verify` APIs to check if the code provided by the user is
 * valid.
 * When enrollment is successful, it calls `onEnrolled`. When the user clicks
 * Cancel the `onCancelled` callback is called.
 */
export function EnrollMFA({
  onEnrolled,
  onCancelled,
}: {
  onEnrolled: () => void
  onCancelled: () => void
}) {
  const [factorId, setFactorId] = useState('')
  const [qr, setQR] = useState('') // holds the QR code image SVG
  const [verifyCode, setVerifyCode] = useState('') // contains the code entered by the user
  const [error, setError] = useState('') // holds an error message

  const onEnableClicked = () => {
    setError('')
    ;(async () => {
      const challenge = await supabase.auth.mfa.challenge({ factorId })
      if (challenge.error) {
        setError(challenge.error.message)
        throw challenge.error
      }

      const challengeId = challenge.data.id

      const verify = await supabase.auth.mfa.verify({
        factorId,
        challengeId,
        code: verifyCode,
      })
      if (verify.error) {
        setError(verify.error.message)
        throw verify.error
      }

      onEnrolled()
    })()
  }

  useEffect(() => {
    ;(async () => {
      const { data, error } = await supabase.auth.mfa.enroll({
        factorType: 'totp',
      })
      if (error) {
        throw error
      }

      setFactorId(data.id)

      // Supabase Auth returns an SVG QR code which you can convert into a data
      // URL that you can place in an <img> tag.
      setQR(data.totp.qr_code)
    })()
  }, [])

  return (
    <>
      {error && <div className="error">{error}</div>}
      <img src={qr} />
      <input
        type="text"
        value={verifyCode}
        onChange={(e) => setVerifyCode(e.target.value.trim())}
      />
      <input type="button" value="Enable" onClick={onEnableClicked} />
      <input type="button" value="Cancel" onClick={onCancelled} />
    </>
  )
}
```

---

TITLE: Creating Server Supabase Client for Server Components
DESCRIPTION: Provides a function `useSupabaseServer` to create a server-side Supabase client using `@supabase/ssr`'s `createServerClient`. This client is designed for use in Next.js server components and handles cookie management for authentication, ensuring secure and authenticated data fetching on the server.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-01-12-react-query-nextjs-app-router-cache-helpers.mdx#_snippet_7

LANGUAGE: typescript
CODE:

```
import { createServerClient } from '@supabase/ssr'
import { cookies } from 'next/headers'
import { Database } from './database.types'

export default function useSupabaseServer(cookieStore: ReturnType<typeof cookies>) {
  return createServerClient<Database>(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        get(name: string) {
          return cookieStore.get(name)?.value
        }
      }
    }
  )
}
```

---

TITLE: Supabase Session Update Utility for Next.js Middleware (JavaScript)
DESCRIPTION: This `updateSession` utility function, designed for Next.js middleware, refreshes the Supabase authentication token. It creates a server-side Supabase client, fetches the user session, and then updates both the request and response cookies to maintain the user's session across server and client components.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-nextjs.mdx#_snippet_8

LANGUAGE: javascript
CODE:

```
import { createServerClient } from '@supabase/ssr'
import { NextResponse } from 'next/server'

export async function updateSession(request) {
  let supabaseResponse = NextResponse.next({
    request
  })

  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY,
    {
      cookies: {
        getAll() {
          return request.cookies.getAll()
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value, options }) => request.cookies.set(name, value))
          supabaseResponse = NextResponse.next({
            request
          })
          cookiesToSet.forEach(({ name, value, options }) =>
            supabaseResponse.cookies.set(name, value, options)
          )
        }
      }
    }
  )

  // refreshing the auth token
  await supabase.auth.getUser()

  return supabaseResponse
}
```

---

TITLE: Adding an Exclusion Constraint for Non-Overlapping `tstzrange` Durations
DESCRIPTION: This SQL statement adds an `EXCLUDE` constraint named `exclude_duration` to the `reservations` table. It uses a GiST index and the `&&` operator to prevent any new inserts or updates from creating reservations whose `duration` range overlaps with existing ones, ensuring data integrity for time-based events.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-07-11-range-columns.mdx#_snippet_3

LANGUAGE: SQL
CODE:

```
alter table reservations
	add constraint exclude_duration exclude
	using gist (duration with &&)
```

---

TITLE: Creating Private Posts Table and MFA Policy with Supabase SQL
DESCRIPTION: This SQL snippet sets up a `private_posts` table to store secure information, inserts dummy data, enables Row Level Security (RLS), and defines a policy that restricts access to users who have successfully signed in via Multi-Factor Authentication (MFA), identified by an 'aal2' authentication assurance level.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/auth/flutter-mfa/README.md#_snippet_0

LANGUAGE: SQL
CODE:

```
-- Dummy table that contains "secure" information
create table if not exists public.private_posts (
    id int generated by default as identity primary key,
    content text not null
);

-- Dmmy "secure" data
insert into public.private_posts
    (content)
values
    ('Flutter is awesome!'),
    ('Supabase is awesome!'),
    ('Postgres is awesome!');

-- Enable RLS for private_posts table
alter table public.private_posts enable row level security;

-- Create a policy that only allows read if they user has signed in via MFA
create policy "Users can view private_posts if they have signed in via MFA"
  on public.private_posts
  for select
  to authenticated
  using ((select auth.jwt()->>'aal') = 'aal2');
```

---

TITLE: Defining Row Level Security Policies for Supabase Realtime Authorization - SQL
DESCRIPTION: This SQL snippet establishes RLS policies for `public.profiles`, `public.rooms`, `public.rooms_users`, and `realtime.messages`. These policies authorize authenticated users to perform read/insert operations on public tables and control access to Realtime Broadcast and Presence based on user membership in `public.rooms_users`, ensuring secure channel access.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/realtime/nextjs-authorization-demo/README.md#_snippet_1

LANGUAGE: SQL
CODE:

```
CREATE POLICY "authenticated can view all profiles"
ON "public"."profiles"
AS PERMISSIVE FOR SELECT
TO authenticated
USING (true);

CREATE POLICY "supabase_auth_admin can insert profile"
ON "public"."profiles"
AS PERMISSIVE FOR INSERT
TO supabase_auth_admin
WITH CHECK (true);

CREATE POLICY "authenticated can read rooms"
ON "public"."rooms"
AS PERMISSIVE FOR SELECT
TO authenticated
USING (TRUE);

CREATE POLICY "authenticated can add rooms"
ON "public"."rooms"
AS PERMISSIVE FOR INSERT
TO authenticated
WITH CHECK (TRUE);

CREATE POLICY "authenticated can read rooms_users"
ON "public"."rooms_users"
AS PERMISSIVE FOR SELECT
TO authenticated
USING (TRUE);

CREATE POLICY "authenticated can add rooms_users"
ON "public"."rooms_users"
AS PERMISSIVE FOR INSERT
TO authenticated
WITH CHECK (TRUE);

CREATE POLICY "authenticated can read broadcast and presence state"
ON "realtime"."messages"
AS PERMISSIVE FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1
    FROM public.rooms_users
    WHERE user_id = (select auth.uid())
    AND room_topic = realtime.topic()
    AND realtime.messages.extension in ('broadcast', 'presence')
  )
);

CREATE POLICY "authenticated can send broadcast and track presence"
ON "realtime"."messages"
AS PERMISSIVE FOR INSERT
TO authenticated
WITH CHECK (
  EXISTS (
    SELECT 1
    FROM public.rooms_users
    WHERE user_id = (select auth.uid())
    AND room_topic = realtime.topic()
    AND realtime.messages.extension in ('broadcast', 'presence')
  )
);
```

---

TITLE: Main Application Logic with Supabase Session (Vue.js)
DESCRIPTION: This `App.vue` component serves as the main entry point for the application, dynamically rendering either the `Account` or `Auth` component based on the user's authentication status. It uses `onMounted` to fetch the initial session and `supabase.auth.onAuthStateChange` to reactively update the session state, ensuring the correct component is displayed.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-vue-3.mdx#_snippet_6

LANGUAGE: vue
CODE:

```
<script setup>
import { onMounted, ref } from 'vue'
import Account from './components/Account.vue'
import Auth from './components/Auth.vue'
import { supabase } from './supabase'

const session = ref()

onMounted(() => {
  supabase.auth.getSession().then(({ data }) => {
    session.value = data.session
  })

  supabase.auth.onAuthStateChange((_, _session) => {
    session.value = _session
  })
})
</script>

<template>
  <div class="container" style="padding: 50px 0 100px 0">
    <Account v-if="session" :session="session" />
    <Auth v-else />
  </div>
</template>
```

---

TITLE: Initializing Supabase Vecs Collection with Hugging Face Adapter (Python)
DESCRIPTION: This snippet demonstrates how to initialize a Supabase `vecs` collection with a Hugging Face adapter. It configures the collection to automatically chunk large text into paragraphs using `ParagraphChunker` and then convert each chunk into an embedding using the `TextEmbedding` adapter with the `Supabase/gte-small` model. This setup streamlines the process of preparing text data for vector storage.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-08-07-hugging-face-supabase.mdx#_snippet_0

LANGUAGE: Python
CODE:

```
import vecs
from vecs.adapter import Adapter, ParagraphChunker, TextEmbedding

vx = vecs.create_client("postgresql://<user>:<password>@<host>:<port>/<db_name>")

# create a new collection with an associated adapter
docs = vx.get_or_create_collection(
    name="docs",
    # here comes the new part
    adapter=Adapter(
        [
            ParagraphChunker(skip_during_query=True),
            TextEmbedding(model='Supabase/gte-small'),
        ]
    )
)
```

---

TITLE: Inefficient Policy Lacking Role Specification (SQL)
DESCRIPTION: This policy allows users to access their own records in `rls_test` but omits the `TO` clause for role specification. This can lead to the policy being evaluated for all users, including `anon`, even if `auth.uid()` would fail, thus impacting performance.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/prompts/database-rls-policies.md#_snippet_13

LANGUAGE: SQL
CODE:

```
create policy "Users can access their own records" on rls_test
using ( auth.uid() = user_id );
```

---

TITLE: Implement Google Sign-in with Supabase in React Native
DESCRIPTION: This snippet demonstrates how to set up Google Sign-in in a React Native application, configure it with a web client ID, and then use the obtained ID token to authenticate with Supabase. It includes error handling for common sign-in issues like cancellation or unavailable Play Services.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/social-login/auth-google.mdx#_snippet_10

LANGUAGE: javascript
CODE:

```
import {
  GoogleSignin,
  GoogleSigninButton,
  statusCodes,
} from '@react-native-google-signin/google-signin'
import { supabase } from '../utils/supabase'

export default function () {
  GoogleSignin.configure({
    scopes: ['https://www.googleapis.com/auth/drive.readonly'],
    webClientId: 'YOUR CLIENT ID FROM GOOGLE CONSOLE',
  })

  return (
    <GoogleSigninButton
      size={GoogleSigninButton.Size.Wide}
      color={GoogleSigninButton.Color.Dark}
      onPress={async () => {
        try {
          await GoogleSignin.hasPlayServices()
          const userInfo = await GoogleSignin.signIn()
          if (userInfo.data.idToken) {
            const { data, error } = await supabase.auth.signInWithIdToken({
              provider: 'google',
              token: userInfo.data.idToken,
            })
            console.log(error, data)
          } else {
            throw new Error('no ID token present!')
          }
        } catch (error: any) {
          if (error.code === statusCodes.SIGN_IN_CANCELLED) {
            // user cancelled the login flow
          } else if (error.code === statusCodes.IN_PROGRESS) {
            // operation (e.g. sign in) is in progress already
          } else if (error.code === statusCodes.PLAY_SERVICES_NOT_AVAILABLE) {
            // play services not available or outdated
          } else {
            // some other error happened
          }
        }
      }}
    />
  )
}
```

---

TITLE: Configuring Supabase Postgres Row Level Security
DESCRIPTION: This SQL script defines a `profiles` table, enables Row Level Security (RLS), and sets up policies for public viewing, user-specific insertion, and user-specific updates. It also configures Supabase Realtime for the `profiles` table and sets up a storage bucket for avatars with public access and upload policies.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/user-management/angular-user-management/README.md#_snippet_6

LANGUAGE: SQL
CODE:

```
-- Create a table for Public Profiles
create table profiles (
  id uuid references auth.users not null,
  updated_at timestamp with time zone,
  username text unique,
  avatar_url text,
  website text,
  primary key (id),
  unique(username),
  constraint username_length check (char_length(username) >= 3)
);
alter table profiles enable row level security;
create policy "Public profiles are viewable by everyone."
  on profiles for select
  using ( true );
create policy "Users can insert their own profile."
  on profiles for insert
  with check ( (select auth.uid()) = id );
create policy "Users can update own profile."
  on profiles for update
  using ( (select auth.uid()) = id );
-- Set up Realtime!
begin;
  drop publication if exists supabase_realtime;
  create publication supabase_realtime;
commit;
alter publication supabase_realtime add table profiles;
-- Set up Storage!
insert into storage.buckets (id, name)
values ('avatars', 'avatars');
create policy "Avatar images are publicly accessible."
  on storage.objects for select
  using ( bucket_id = 'avatars' );
create policy "Anyone can upload an avatar."
  on storage.objects for insert
  with check ( bucket_id = 'avatars' );
```

---

TITLE: Server-Side User Sign-Up with SvelteKit Form Actions (JavaScript)
DESCRIPTION: This JavaScript snippet demonstrates a server-side SvelteKit form action for user sign-up. It processes form data, calls `supabase.auth.signUp` on the server, and handles potential errors using SvelteKit's `fail` utility. This approach ensures secure authentication flows by keeping sensitive operations on the server.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/sveltekit.mdx#_snippet_13

LANGUAGE: JavaScript
CODE:

```
// src/routes/login/+page.server.js
import { fail } from '@sveltejs/kit'

export const actions = {
  default: async ({ request, url, locals: { supabase } }) => {
    const formData = await request.formData()
    const email = formData.get('email')
    const password = formData.get('password')

    const { error } = await
```

---

TITLE: Creating RLS Policy with WITH CHECK for INSERT
DESCRIPTION: Defines an RLS policy using `WITH CHECK` for `INSERT` operations, ensuring that users can only add records where their `user_id` matches their authenticated `auth.uid()`. It includes examples of both failing and successful inserts to illustrate the policy's enforcement.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/rls-simplified-BJTcS8.mdx#_snippet_3

LANGUAGE: SQL
CODE:

```
-- Allow users to add to table, but make sure their user_id matches the one in their JWT:

create policy "Allow user to add posts"
on "public"."posts"
as PERMISSIVE
for INSERT
to authenticated
with check(
  (select auth.uid()) = user_id
);

-- Example: failing insert
INSERT INTO posts
VALUES (<false id>, <comment>);

-- Example: successful insert
INSERT INTO posts
VALUES (<real id>, <comment>);
```

---

TITLE: Fetching Data in Next.js Edge Server Component (JavaScript)
DESCRIPTION: This example shows how to fetch data from Supabase within a Next.js Server Component configured to run on the Edge runtime. It uses `createServerComponentClient` with `cookies()` for session management, ensuring data is fetched dynamically and close to the user.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs.mdx#_snippet_21

LANGUAGE: JavaScript
CODE:

```
import { cookies } from 'next/headers'
import { createServerComponentClient } from '@supabase/auth-helpers-nextjs'

export const runtime = 'edge'
export const dynamic = 'force-dynamic'

export default async function Page() {
  const cookieStore = cookies()

  const supabase = createServerComponentClient({
    cookies: () => cookieStore,
  })

  const { data } = await supabase.from('todos').select()
  return <pre>{JSON.stringify(data, null, 2)}</pre>
}
```

---

TITLE: Declaring Supabase Environment Variables in Next.js
DESCRIPTION: This snippet shows how to declare environment variables in a `.env.local` file for a Next.js project. These variables, `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY`, are essential for connecting to your Supabase project's API.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs.mdx#_snippet_1

LANGUAGE: bash
CODE:

```
NEXT_PUBLIC_SUPABASE_URL=your-supabase-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-supabase-anon-key
```

---

TITLE: Declaring Supabase Environment Variables (.env.local)
DESCRIPTION: This snippet shows the required environment variables for connecting a Next.js application to Supabase. Users must rename `.env.example` to `.env.local` and replace the placeholders with their actual Supabase URL and anonymous key, which are crucial for API communication.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/quickstarts/nextjs.mdx#_snippet_1

LANGUAGE: text
CODE:

```
NEXT_PUBLIC_SUPABASE_URL=<SUBSTITUTE_SUPABASE_URL>
NEXT_PUBLIC_SUPABASE_ANON_KEY=<SUBSTITUTE_SUPABASE_ANON_KEY>
```

---

TITLE: Implementing Account Page in Flutter with Supabase
DESCRIPTION: This Dart code defines the `AccountPage` widget, allowing users to view and update their profile details (username, website) and sign out. It handles data fetching from Supabase, profile updates using `upsert`, and user sign-out, including error handling and UI state management. It depends on `supabase_flutter` and `main.dart` for Supabase client and snack bar functionality.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-flutter.mdx#_snippet_7

LANGUAGE: dart
CODE:

```
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_quickstart/main.dart';
import 'package:supabase_quickstart/pages/login_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _usernameController = TextEditingController();
  final _websiteController = TextEditingController();

  String? _avatarUrl;
  var _loading = true;

  /// Called once a user id is received within `onAuthenticated()`
  Future<void> _getProfile() async {
    setState(() {
      _loading = true;
    });

    try {
      final userId = supabase.auth.currentSession!.user.id;
      final data =
          await supabase.from('profiles').select().eq('id', userId).single();
      _usernameController.text = (data['username'] ?? '') as String;
      _websiteController.text = (data['website'] ?? '') as String;
      _avatarUrl = (data['avatar_url'] ?? '') as String;
    } on PostgrestException catch (error) {
      if (mounted) context.showSnackBar(error.message, isError: true);
    } catch (error) {
      if (mounted) {
        context.showSnackBar('Unexpected error occurred', isError: true);
      }
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  /// Called when user taps `Update` button
  Future<void> _updateProfile() async {
    setState(() {
      _loading = true;
    });
    final userName = _usernameController.text.trim();
    final website = _websiteController.text.trim();
    final user = supabase.auth.currentUser;
    final updates = {
      'id': user!.id,
      'username': userName,
      'website': website,
      'updated_at': DateTime.now().toIso8601String(),
    };
    try {
      await supabase.from('profiles').upsert(updates);
      if (mounted) context.showSnackBar('Successfully updated profile!');
    } on PostgrestException catch (error) {
      if (mounted) context.showSnackBar(error.message, isError: true);
    } catch (error) {
      if (mounted) {
        context.showSnackBar('Unexpected error occurred', isError: true);
      }
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Future<void> _signOut() async {
    try {
      await supabase.auth.signOut();
    } on AuthException catch (error) {
      if (mounted) context.showSnackBar(error.message, isError: true);
    } catch (error) {
      if (mounted) {
        context.showSnackBar('Unexpected error occurred', isError: true);
      }
    } finally {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginPage()),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(labelText: 'User Name'),
          ),
          const SizedBox(height: 18),
          TextFormField(
            controller: _websiteController,
            decoration: const InputDecoration(labelText: 'Website'),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: _loading ? null : _updateProfile,
            child: Text(_loading ? 'Saving...' : 'Update'),
          ),
          const SizedBox(height: 18),
          TextButton(onPressed: _signOut, child: const Text('Sign Out')),
        ],
      ),
    );
  }
}
```

---

TITLE: Fetching Single Post Statically in Next.js Dynamic Route
DESCRIPTION: This Next.js Server Component handles a dynamic route for individual posts. It fetches a single post from Supabase based on the `id` parameter and uses `notFound()` if the post does not exist, demonstrating on-demand static generation.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-11-17-fetching-and-caching-supabase-data-in-next-js-server-components.mdx#_snippet_8

LANGUAGE: tsx
CODE:

```
import supabase from '../../../utils/supabase'
import { notFound } from 'next/navigation'

export default async function Post({ params: { id } }: { params: { id: string } }) {
  const { data } = await supabase.from('posts').select().match({ id }).single()

  if (!data) {
    notFound()
  }

  return <pre>{JSON.stringify(data, null, 2)}</pre>
}
```

---

TITLE: Creating a Public SELECT Policy for Profiles Table
DESCRIPTION: This sequence of SQL commands first creates a `profiles` table, then enables Row Level Security on it. Finally, it defines a `SELECT` policy that makes all profiles visible to everyone, including unauthenticated users, by granting access to the `anon` role with a `true` condition.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/row-level-security.mdx#_snippet_5

LANGUAGE: SQL
CODE:

```
create table profiles (
  id uuid primary key,
  user_id references auth.users,
  avatar_url text
);

alter table profiles enable row level security;

create policy "Public profiles are visible to everyone."
on profiles for select
to anon         -- the Postgres Role (recommended)
using ( true ); -- the actual Policy
```

---

TITLE: Supabase Data API Hardening Configuration
DESCRIPTION: Guidance on hardening the Supabase Data API, including changing the default schema from `public` to `api` and aligning with PostgREST's Schema Isolation for enhanced security. This configuration helps prevent accidental exposure of database objects.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-07-11-hardening-supabase.mdx#_snippet_0

LANGUAGE: APIDOC
CODE:

```
Feature: Data API Hardening
Description: Configure the default schema for the Supabase Data API.
Default Schema: public
Recommended Schema: api (for enhanced security and PostgREST alignment)
Configuration Path: Supabase Dashboard -> Project Settings -> API Settings
Impact: Isolates API endpoints to a specific schema, preventing accidental exposure of other database objects.
Related Concepts:
  - PostgREST Schema Isolation
  - Row Level Security (RLS)
```

---

TITLE: Starting Local Supabase Stack
DESCRIPTION: This snippet provides commands to start the local Supabase services, including Postgres, Auth, and Storage. This command makes the local Supabase instance accessible for development at http://localhost:54323.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/local-development.mdx#_snippet_2

LANGUAGE: sh
CODE:

```
npx supabase start
```

LANGUAGE: sh
CODE:

```
yarn supabase start
```

LANGUAGE: sh
CODE:

```
pnpx supabase start
```

LANGUAGE: sh
CODE:

```
supabase start
```

---

TITLE: Importing NPM Modules in TypeScript
DESCRIPTION: This snippet demonstrates how to import npm modules into Supabase Edge Functions using the `npm:` specifier. It allows developers to leverage a vast ecosystem of existing JavaScript packages directly within their Deno-powered functions.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/functions/dependencies.mdx#_snippet_0

LANGUAGE: TypeScript
CODE:

```
import { createClient } from 'npm:@supabase/supabase-js@2'
```

---

TITLE: Releasing Supabase Schema Changes in CI/CD
DESCRIPTION: This sequence of commands is designed for CI/CD workflows to release schema changes to remote Supabase projects. The `link` command connects the local project to a specified remote project using its ID, and `db push` applies local schema migrations to the linked remote database.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-08-15-supabase-cli-v1-and-admin-api-beta.mdx#_snippet_6

LANGUAGE: bash
CODE:

```
$ supabase link --project-ref $PROJECT_ID
$ supabase db push
```

---

TITLE: Initializing Supabase Database for LangChain with pgvector - SQL
DESCRIPTION: This SQL snippet prepares the Supabase database for LangChain integration. It enables the `pgvector` extension for vector embeddings, creates a `documents` table to store content, metadata, and embeddings, and defines a `match_documents` function for performing similarity searches with optional filtering based on metadata.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/langchain.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
-- Enable the pgvector extension to work with embedding vectors
create extension vector;

-- Create a table to store your documents
create table documents (
  id bigserial primary key,
  content text, -- corresponds to Document.pageContent
  metadata jsonb, -- corresponds to Document.metadata
  embedding vector(1536) -- 1536 works for OpenAI embeddings, change if needed
);

-- Create a function to search for documents
create function match_documents (
  query_embedding vector(1536),
  match_count int default null,
  filter jsonb DEFAULT '{}'
) returns table (
  id bigint,
  content text,
  metadata jsonb,
  similarity float
)
language plpgsql
as $$
#variable_conflict use_column
begin
  return query
  select
    id,
    content,
    metadata,
    1 - (documents.embedding <=> query_embedding) as similarity
  from documents
  where metadata @> filter
  order by documents.embedding <=> query_embedding
  limit match_count;
end;
$$;
```

---

TITLE: Testing Supabase Edge Function Locally (Shell)
DESCRIPTION: These shell commands facilitate local testing of the deployed Edge Function. The first command starts a local server for Supabase functions, and the second uses `curl` to send a POST request with a sample input to the `embed` function, demonstrating how to retrieve the generated embedding. Replace `ANON_KEY` with your project's anonymous key.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/quickstarts/generate-text-embeddings.mdx#_snippet_4

LANGUAGE: shell
CODE:

```
supabase functions serve
```

LANGUAGE: shell
CODE:

```
curl --request POST 'http://localhost:54321/functions/v1/embed' \
  --header 'Authorization: Bearer ANON_KEY' \
  --header 'Content-Type: application/json' \
  --data '{ "input": "hello world" }'
```

---

TITLE: Applying RLS Policies with `authorize` Function in PostgreSQL
DESCRIPTION: These SQL statements define RLS policies for `public.channels` and `public.messages` tables, allowing authenticated users to perform delete operations. The policies leverage the `public.authorize` function to ensure that the user's role has the specific `channels.delete` or `messages.delete` permission before allowing the action.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/custom-claims-and-role-based-access-control-rbac.mdx#_snippet_5

LANGUAGE: sql
CODE:

```
create policy "Allow authorized delete access" on public.channels for delete to authenticated using ( (SELECT authorize('channels.delete')) );
create policy "Allow authorized delete access" on public.messages for delete to authenticated using ( (SELECT authorize('messages.delete')) );
```

---

TITLE: Signing Up Users with Supabase Auth (Current)
DESCRIPTION: This snippet illustrates the updated `supabase.auth.signUp` method for user registration. It now accepts a single object as an argument, containing the `email` and `password` properties. The function returns an object with `user` data and an `error` object, aligning with the new error handling pattern.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2020-10-30-improved-dx.mdx#_snippet_3

LANGUAGE: js
CODE:

```
const { user, error } = await supabase.auth.signUp({
  email: 'someone@email.com',
  password: 'password',
})
```

---

TITLE: Fetching Data in Next.js Edge Server Component (TypeScript)
DESCRIPTION: This TypeScript snippet demonstrates fetching data from Supabase in a Next.js Server Component optimized for the Edge runtime. It utilizes `createServerComponentClient` with `cookies()` and a `Database` type for type-safe, dynamic data retrieval near the user.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs.mdx#_snippet_22

LANGUAGE: TypeScript
CODE:

```
import { cookies } from 'next/headers'
import { createServerComponentClient } from '@supabase/auth-helpers-nextjs'

import type { Database } from '@/lib/database.types'

export const runtime = 'edge'
export const dynamic = 'force-dynamic'

export default async function Page() {
  const cookieStore = cookies()

  const supabase = createServerComponentClient<Database>({
    cookies: () => cookieStore,
  })

  const { data } = await supabase.from('todos').select()
  return <pre>{JSON.stringify(data, null, 2)}</pre>
}
```

---

TITLE: Query data from Supabase in a React App
DESCRIPTION: In `App.jsx`, add a `getInstruments` function to fetch the data and display the query result to the page using a Supabase client.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/quickstarts/reactjs.mdx#_snippet_3

LANGUAGE: js
CODE:

```
import { useEffect, useState } from "react";
import { createClient } from "@supabase/supabase-js";

const supabase = createClient(import.meta.env.VITE_SUPABASE_URL, import.meta.env.VITE_SUPABASE_ANON_KEY);

function App() {
  const [instruments, setInstruments] = useState([]);

  useEffect(() => {
    getInstruments();
  }, []);

  async function getInstruments() {
    const { data } = await supabase.from("instruments").select();
    setInstruments(data);
  }

  return (
    <ul>
      {instruments.map((instrument) => (
        <li key={instrument.name}>{instrument.name}</li>
      ))}
    </ul>
  );
}

export default App;
```

---

TITLE: Adding Supabase Flutter Dependency
DESCRIPTION: This command adds the `supabase_flutter` package to the Flutter project's dependencies. This package provides the necessary client for interacting with Supabase services, including authentication, database, and storage.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-05-04-flutter-multi-factor-authentication.mdx#_snippet_1

LANGUAGE: bash
CODE:

```
dart pub add supabase_flutter
```

---

TITLE: Generating TypeScript Types for Local Project
DESCRIPTION: Generates TypeScript type definitions for a local Supabase development environment, saving them to `database.types.ts`. This command is used when working with a locally running Supabase instance.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/api/rest/generating-types.mdx#_snippet_4

LANGUAGE: bash
CODE:

```
npx supabase gen types typescript --local > database.types.ts
```

---

TITLE: Regenerating Supabase Database Types (Bash)
DESCRIPTION: This command regenerates the TypeScript types for the local Supabase database schema. It outputs the generated types to registry/default/fixtures/database.types.ts, which is essential for maintaining type safety and autocompletion when interacting with the Supabase client in a TypeScript project.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/ui-library/README.md#_snippet_1

LANGUAGE: bash
CODE:

```
supabase gen types --local > registry/default/fixtures/database.types.ts
```

---

TITLE: Selecting Document Sections with RLS Applied (SQL)
DESCRIPTION: This SQL query selects all columns from the `document_sections` table. When executed by an authenticated user, the previously defined RLS policy will implicitly filter the results, returning only the document sections that the current user has access to.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/rag-with-permissions.mdx#_snippet_2

LANGUAGE: SQL
CODE:

```
select * from document_sections;
```

---

TITLE: Supabase Initialization Session Handling Update (Dart)
DESCRIPTION: In Supabase v2, `Supabase.initialize()` no longer awaits session refresh, returning immediately for faster app launch, especially in poor network conditions. Developers should now explicitly check `supabase.auth.currentSession?.isExpired` to ensure session validity and listen for `onAuthStateChange` events for a `tokenRefreshed` event if a valid session is required immediately after initialization.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/docs/ref/dart/upgrade-guide.mdx#_snippet_5

LANGUAGE: Dart
CODE:

```
// Session is valid, no check required
final session = supabase.auth.currentSession;
```

LANGUAGE: Dart
CODE:

```
final session = supabase.auth.currentSession;

// Check if the session is valid.
final isSessionExpired = session?.isExpired;
```

---

TITLE: Acquiring Transactional Postgres Advisory Lock in JavaScript
DESCRIPTION: This JavaScript snippet demonstrates how to acquire a transactional Postgres advisory lock using `pg_advisory_xact_lock` within a database transaction. The lock, identified by a hashed key, ensures that only one concurrent operation can modify an S3 object at a time. It also shows conditional metadata insertion into `storage.objects` upon completion of an upload, with the lock automatically released at transaction end.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-04-12-storage-v3-resumable-uploads.mdx#_snippet_4

LANGUAGE: js
CODE:

```
const key = `/bucket-name/folder/bunny.jpg`
const hashedKey = hash(key)

await db.withTransaction(() => {
	// try acquiring a transactional advisory lock
	// these locks are automatically released at the end of every transaction
	await db.run('SELECT pg_advisory_xact_lock(?)', hashedKey);

	// the current server can upload to s3 at the given key
	await uploadObject();

   if (isLastChunk) {
    // storage.objects stores the object metadata of all objects
    // It doubles up as a way to enforce authorization.
    // If a user is able to insert into this table, they can upload.
    await db.run('insert into storage.objects(..) values(..)')
   }
});

// the advisory lock is automatically released at this point
```

---

TITLE: Creating Supabase Server Client in Next.js (JavaScript)
DESCRIPTION: This JavaScript utility function `createClient` initializes a Supabase client for use in Server Components, Server Actions, and Route Handlers. It uses `createServerClient` from `@supabase/ssr` and integrates with Next.js `cookies` to manage user sessions, ensuring secure server-side authentication.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-nextjs.mdx#_snippet_6

LANGUAGE: javascript
CODE:

```
import { createServerClient } from '@supabase/ssr'
import { cookies } from 'next/headers'

export async function createClient() {
  const cookieStore = await cookies()

  // Create a server's supabase client with newly configured cookie,
  // which could be used to maintain user's session
  return createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY,
    {
      cookies: {
        getAll() {
          return cookieStore.getAll()
        },
        setAll(cookiesToSet) {
          try {
            cookiesToSet.forEach(({ name, value, options }) =>
              cookieStore.set(name, value, options)
            )
          } catch {
            // The `setAll` method was called from a Server Component.
            // This can be ignored if you have middleware refreshing
            // user sessions.
          }
        }
      }
    }
  )
}
```

---

TITLE: Complete Refine AuthProvider for Supabase (TypeScript)
DESCRIPTION: This comprehensive TypeScript snippet defines the `authProvider` object, implementing all required `AuthBindings` methods for Refine. It includes `login` (using Supabase Magic Links), `logout` (signing out from Supabase), `onError` for error handling, `check` for session validation, and `getIdentity` to retrieve user information. This provider integrates Supabase authentication seamlessly with the Refine framework.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-refine.mdx#_snippet_7

LANGUAGE: typescript
CODE:

```
import { AuthBindings } from '@refinedev/core'

import { supabaseClient } from './utility'

const authProvider: AuthBindings = {
  login: async ({ email }) => {
    try {
      const { error } = await supabaseClient.auth.signInWithOtp({ email })

      if (!error) {
        alert('Check your email for the login link!')
        return {
          success: true,
        }
      }

      throw error
    } catch (e: any) {
      alert(e.message)
      return {
        success: false,
        e,
      }
    }
  },
  logout: async () => {
    const { error } = await supabaseClient.auth.signOut()

    if (error) {
      return {
        success: false,
        error,
      }
    }

    return {
      success: true,
      redirectTo: '/',
    }
  },
  onError: async (error) => {
    console.error(error)
    return { error }
  },
  check: async () => {
    try {
      const { data } = await supabaseClient.auth.getSession()
      const { session } = data

      if (!session) {
        return {
          authenticated: false,
          error: {
            message: 'Check failed',
            name: 'Session not found',
          },
          logout: true,
          redirectTo: '/login',
        }
      }
    } catch (error: any) {
      return {
        authenticated: false,
        error: error || {
          message: 'Check failed',
          name: 'Not authenticated',
        },
        logout: true,
        redirectTo: '/login',
      }
    }

    return {
      authenticated: true,
    }
  },
  getIdentity: async () => {
    const { data } = await supabaseClient.auth.getUser()

    if (data?.user) {
      return {
        ...data.user,
        name: data.user.email,
      }
    }

    return null
  },
}
```

---

TITLE: Generating TypeScript Types for Supabase Database
DESCRIPTION: These commands start the local Supabase development environment and then generate TypeScript types based on the current database schema. The generated types are piped into utils/database.types.ts, providing end-to-end type safety for Supabase interactions in the application.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-09-23-local-first-expo-legend-state.mdx#_snippet_7

LANGUAGE: bash
CODE:

```
supabase start
supabase gen types --lang=typescript --local > utils/database.types.ts
```

---

TITLE: Implementing Server-Side OAuth Sign-in with Next.js Server Actions
DESCRIPTION: This snippet demonstrates how to perform a server-side OAuth sign-in using Supabase within a Next.js Server Action. It leverages the 'use server' directive to define a server-only function signIn that handles authentication, which is then invoked by a form submission. This approach enables secure, server-side user authentication without client-side JavaScript.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-11-01-supabase-is-now-compatible-with-nextjs-14.mdx#_snippet_0

LANGUAGE: tsx
CODE:

```
export default async function Page() {
  const signIn = async () => {
    'use server'
    supabase.auth.signInWithOAuth({...})
  }

  return (
    <form action={signIn}>
      <button>Sign in with GitHub</button>
    </form>
  )
}
```

---

TITLE: Supabase Edge Function: Generate and Store OpenAI Embeddings
DESCRIPTION: This TypeScript code implements a Supabase Edge Function designed to process embedding generation jobs. It initializes OpenAI and Postgres clients, defines Zod schemas for job validation, and exposes an HTTP POST endpoint. The function fetches content from a specified database table, generates embeddings using OpenAI's `text-embedding-3-small` model, and updates the corresponding database column. It includes robust error handling and job status reporting. Note: The provided code snippet for the final SQL update is incomplete.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/automatic-embeddings.mdx#_snippet_8

LANGUAGE: typescript
CODE:

```
// Setup type definitions for built-in Supabase Runtime APIs
import 'jsr:@supabase/functions-js/edge-runtime.d.ts'

// We'll use the OpenAI API to generate embeddings
import OpenAI from 'jsr:@openai/openai'

import { z } from 'npm:zod'

// We'll make a direct Postgres connection to update the document
import postgres from 'https://deno.land/x/postgresjs@v3.4.5/mod.js'

// Initialize OpenAI client
const openai = new OpenAI({
  // We'll need to manually set the `OPENAI_API_KEY` environment variable
  apiKey: Deno.env.get('OPENAI_API_KEY'),
})

// Initialize Postgres client
const sql = postgres(
  // `SUPABASE_DB_URL` is a built-in environment variable
  Deno.env.get('SUPABASE_DB_URL')!
)

const jobSchema = z.object({
  jobId: z.number(),
  id: z.number(),
  schema: z.string(),
  table: z.string(),
  contentFunction: z.string(),
  embeddingColumn: z.string(),
})

const failedJobSchema = jobSchema.extend({
  error: z.string(),
})

type Job = z.infer<typeof jobSchema>
type FailedJob = z.infer<typeof failedJobSchema>

type Row = {
  id: string
  content: unknown
}

const QUEUE_NAME = 'embedding_jobs'

// Listen for HTTP requests
Deno.serve(async (req) => {
  if (req.method !== 'POST') {
    return new Response('expected POST request', { status: 405 })
  }

  if (req.headers.get('content-type') !== 'application/json') {
    return new Response('expected json body', { status: 400 })
  }

  // Use Zod to parse and validate the request body
  const parseResult = z.array(jobSchema).safeParse(await req.json())

  if (parseResult.error) {
    return new Response(`invalid request body: ${parseResult.error.message}`, {
      status: 400,
    })
  }

  const pendingJobs = parseResult.data

  // Track jobs that completed successfully
  const completedJobs: Job[] = []

  // Track jobs that failed due to an error
  const failedJobs: FailedJob[] = []

  async function processJobs() {
    let currentJob: Job | undefined

    while ((currentJob = pendingJobs.shift()) !== undefined) {
      try {
        await processJob(currentJob)
        completedJobs.push(currentJob)
      } catch (error) {
        failedJobs.push({
          ...currentJob,
          error: error instanceof Error ? error.message : JSON.stringify(error),
        })
      }
    }
  }

  try {
    // Process jobs while listening for worker termination
    await Promise.race([processJobs(), catchUnload()])
  } catch (error) {
    // If the worker is terminating (e.g. wall clock limit reached),
    // add pending jobs to fail list with termination reason
    failedJobs.push(
      ...pendingJobs.map((job) => ({
        ...job,
        error: error instanceof Error ? error.message : JSON.stringify(error),
      }))
    )
  }

  // Log completed and failed jobs for traceability
  console.log('finished processing jobs:', {
    completedJobs: completedJobs.length,
    failedJobs: failedJobs.length,
  })

  return new Response(
    JSON.stringify({
      completedJobs,
      failedJobs,
    }),
    {
      // 200 OK response
      status: 200,

      // Custom headers to report job status
      headers: {
        'content-type': 'application/json',
        'x-completed-jobs': completedJobs.length.toString(),
        'x-failed-jobs': failedJobs.length.toString(),
      },
    }
  )
})

/**
 * Generates an embedding for the given text.
 */
async function generateEmbedding(text: string) {
  const response = await openai.embeddings.create({
    model: 'text-embedding-3-small',
    input: text,
  })
  const [data] = response.data

  if (!data) {
    throw new Error('failed to generate embedding')
  }

  return data.embedding
}

/**
 * Processes an embedding job.
 */
async function processJob(job: Job) {
  const { jobId, id, schema, table, contentFunction, embeddingColumn } = job

  // Fetch content for the schema/table/row combination
  const [row]: [Row] = await sql`
    select
      id,
      ${sql(contentFunction)}(t) as content
    from
      ${sql(schema)}.${sql(table)} t
    where
      id = ${id}
  `

  if (!row) {
    throw new Error(`row not found: ${schema}.${table}/${id}`)
  }

  if (typeof row.content !== 'string') {
    throw new Error(`invalid content - expected string: ${schema}.${table}/${id}`)
  }

  const embedding = await generateEmbedding(row.content)

  await sql`
    update
      ${sql(schema)}.${sql(table)}
    set
      ${sql(embeddingColumn)} = ${JSON.stringify(embedding)}
    where
      id = ${id}
  `

  await sql`
```

---

TITLE: Starting Local Supabase Stack with CLI (Shell)
DESCRIPTION: These commands initialize a new Supabase project and start the entire Supabase stack locally on your machine, enabling local development and testing.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/cli.mdx#_snippet_0

LANGUAGE: Shell
CODE:

```
supabase init
supabase start
```

---

TITLE: Querying Data with Supabase JavaScript Client in Deno Edge Function
DESCRIPTION: This Deno Edge Function demonstrates how to initialize the Supabase JavaScript client and query data from a 'countries' table. It retrieves Supabase URL and anonymous key from environment variables and passes the request's Authorization header for Row Level Security (RLS). The function returns the fetched data as a JSON response or an error message.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-09-12-edge-functions-faster-smaller.mdx#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import { createClient } from 'npm:@supabase/supabase-js@2'

Deno.serve(async (_req) => {
  try {
    const supabase = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      { global: { headers: { Authorization: req.headers.get('Authorization')! } } }
    )

    const { data, error } = await supabase.from('countries').select('*')

    if (error) {
      throw error
    }

    return new Response(JSON.stringify({ data }), {
      headers: { 'Content-Type': 'application/json' },
      status: 200,
    })
  } catch (err) {
    return new Response(String(err?.message ?? err), { status: 500 })
  }
})
```

---

TITLE: Installing Supabase-JS v2
DESCRIPTION: This command line snippet shows how to install the Supabase-JS v2 library using npm. This is the recommended way to upgrade or start using the latest version of the client library.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-08-16-supabase-js-v2.mdx#_snippet_19

LANGUAGE: Bash
CODE:

```
npm i @supabase/supabase-js@2
```

---

TITLE: Installing Supabase CLI with Scoop on Windows
DESCRIPTION: These commands install the Supabase CLI on Windows using Scoop, a command-line installer. First, it adds the Supabase Scoop bucket, then installs the `supabase` package from that bucket.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/local-development/cli/getting-started.mdx#_snippet_1

LANGUAGE: powershell
CODE:

```
scoop bucket add supabase https://github.com/supabase/scoop-bucket.git
scoop install supabase
```

---

TITLE: Installing Supabase JavaScript Client
DESCRIPTION: This command installs the `@supabase/supabase-js` library, which is the official JavaScript client for interacting with Supabase services. It is a required dependency for any application that needs to communicate with a Supabase backend.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-nextjs.mdx#_snippet_2

LANGUAGE: bash
CODE:

```
npm install @supabase/supabase-js
```

---

TITLE: Implementing Tanstack Query Mutations with Callbacks (JSX)
DESCRIPTION: This example illustrates how to define a Tanstack Query mutation using `useMutation`, incorporating `onSuccess` for positive feedback (e.g., a success toast) and `onError` for handling failures (e.g., an error toast). It highlights the preference for `mutate` over `mutateAsync` to simplify error handling and shows how to invoke the mutation with required parameters within an event handler.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/studio/data/__templates/README.md#_snippet_1

LANGUAGE: jsx
CODE:

```
const { mutate: someAction } = useMutation({
  onSuccess: (res) => {
    toast.success('Success')
  },
  onError: (error) => {
    toast.error(`Failed: ${error.message}`)
  },
})

const onConfirm = async () => {
  // Assuming that your mutation needs a URL param like project ref
  // This check is just to satisfy the linting - there's an implicit assumption that
  // projectRef here will definitely be available since its obtained from the URL
  if (!projectRef) return console.error('Project ref is required')

  // Any logic before calling the mutation
  someAction({ projectRef, otherParameters })
}
```

---

TITLE: Setting Up Supabase Auth Component in React (JavaScript)
DESCRIPTION: This JavaScript code for `App.js` initializes the Supabase client with the project URL and anon key, manages user session state using React hooks, and dynamically renders the Supabase Auth UI component if no active session exists. It also sets up an `onAuthStateChange` listener to update the session state in real-time, ensuring the UI reflects the user's authentication status.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/quickstarts/react.mdx#_snippet_3

LANGUAGE: JavaScript
CODE:

```
import './index.css'
import { useState, useEffect } from 'react'
import { createClient } from '@supabase/supabase-js'
import { Auth } from '@supabase/auth-ui-react'
import { ThemeSupa } from '@supabase/auth-ui-shared'

const supabase = createClient('https://<project>.supabase.co', '<your-anon-key>')

export default function App() {
  const [session, setSession] = useState(null)

  useEffect(() => {
    supabase.auth.getSession().then(({ data: { session } }) => {
      setSession(session)
    })

    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((_event, session) => {
      setSession(session)
    })

    return () => subscription.unsubscribe()
  }, [])

  if (!session) {
    return (<Auth supabaseClient={supabase} appearance={{ theme: ThemeSupa }} />)
  }
  else {
    return (<div>Logged in!</div>)
  }
}
```

---

TITLE: Initializing Supabase Client in JavaScript
DESCRIPTION: This JavaScript code demonstrates how to import `createClient` from `@supabase/supabase-js` and initialize a Supabase client instance using a project URL and a public anonymous key. It then logs the created instance.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-07-16-supabase-js-on-jsr.mdx#_snippet_3

LANGUAGE: js
CODE:

```
import { createClient } from '@supabase/supabase-js'

const supabase = createClient('https://xyzcompany.supabase.co', 'public-anon-key')

console.log('Supabase Instance: ', supabase)
```

---

TITLE: Initializing Supabase Client with Service Role Key (TypeScript)
DESCRIPTION: This snippet demonstrates how to create a Supabase client instance specifically for server-side operations using the `service_role` secret. It imports `createClient` from `@supabase/supabase-js` and configures the `auth` object to disable session persistence, auto-refresh, and URL session detection, which are crucial for secure server environments to prevent accidental exposure of the secret.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/performing-administration-tasks-on-the-server-side-with-the-servicerole-secret-BYM4Fa.mdx#_snippet_0

LANGUAGE: TypeScript
CODE:

```
import { createClient } from '@supabase/supabase-js'

const supabase = createClient(supabaseUrl, serviceRoleSecret, {
  auth: {
    persistSession: false,
    autoRefreshToken: false,
    detectSessionInUrl: false,
  },
})
```

---

TITLE: Querying Paddle Customers from Postgres (SQL)
DESCRIPTION: This SQL query selects specific columns (`id`, `name`, `email`, `status`) from the `paddle.customers` foreign table. It demonstrates how to access data from an external service (Paddle) directly within a Postgres database using a Foreign Data Wrapper (FDW). This allows for seamless integration and querying of external data as if it were local.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-08-16-postgres-foreign-data-wrappers-with-wasm.mdx#_snippet_4

LANGUAGE: SQL
CODE:

```
select id, name, email, status
from paddle.customers;
```

---

TITLE: Calling Llamafile with OpenAI Deno SDK - TypeScript
DESCRIPTION: This TypeScript code demonstrates using the OpenAI Deno SDK within a Supabase Edge Function to communicate with the Llamafile server. It handles streaming responses from the AI model, providing a flexible way to integrate Llamafile's OpenAI-compatible API.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-08-21-mozilla-llamafile-in-supabase-edge-functions.mdx#_snippet_5

LANGUAGE: ts
CODE:

```
import OpenAI from 'https://deno.land/x/openai@v4.53.2/mod.ts'

Deno.serve(async (req) => {
  const client = new OpenAI()
  const { prompt } = await req.json()
  const stream = true

  const chatCompletion = await client.chat.completions.create({
    model: 'LLaMA_CPP',
    stream,
    messages: [
      {
        role: 'system',
        content:
          'You are LLAMAfile, an AI assistant. Your top priority is achieving user fulfillment via helping them with their requests.',
      },
      {
        role: 'user',
        content: prompt,
      },
    ],
  })

  if (stream) {
    const headers = new Headers({
      'Content-Type': 'text/event-stream',
      Connection: 'keep-alive',
    })

    // Create a stream
    const stream = new ReadableStream({
      async start(controller) {
        const encoder = new TextEncoder()

        try {
          for await (const part of chatCompletion) {
            controller.enqueue(encoder.encode(part.choices[0]?.delta?.content || ''))
          }
        } catch (err) {
          console.error('Stream error:', err)
        } finally {
          controller.close()
        }
      },
    })

    // Return the stream to the user
    return new Response(stream, {
      headers,
    })
  }

  return Response.json(chatCompletion)
})
```

---

TITLE: Querying Vectors with Filtering and Similarity Search (SQL)
DESCRIPTION: This SQL query demonstrates how to perform a vector similarity search (`<->` operator) on an `embedding` column while also applying a filter on another column (`category_id`). It orders results by similarity to a given vector and limits the output. A limitation is noted: naive filtering with an index may return fewer rows than requested.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/extensions/pgvector.mdx#_snippet_3

LANGUAGE: SQL
CODE:

```
SELECT * FROM items WHERE category_id = 123 ORDER BY embedding <-> '[3,1,2]' LIMIT 5;
```

---

TITLE: Listening to Postgres Changes with Supabase Dart Realtime
DESCRIPTION: This section introduces the new `.onPostgresChanges()` method for listening to database changes, replacing the generic `.on()` method. V2 provides strongly typed filters and a `PostgresChangePayload` object for callbacks, offering `oldRecord` and `newRecord` properties for improved type safety and data access compared to the dynamic payload in v1.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/docs/ref/dart/upgrade-guide.mdx#_snippet_14

LANGUAGE: Dart
CODE:

```
supabase.channel('my_channel').on(
  RealtimeListenTypes.postgresChanges,
  ChannelFilter(
    event: '*',
    schema: 'public',
    table: 'messages',
    filter: 'room_id=eq.200',
  ),
  (dynamic payload, [ref]) {
    final Map<String, dynamic> newRecord = payload['new'];
    final Map<String, dynamic> oldRecord = payload['old'];
  },
).subscribe();
```

LANGUAGE: Dart
CODE:

```
supabase.channel('my_channel')
  .onPostgresChanges(
    event: PostgresChangeEvent.all,
    schema: 'public',
    table: 'messages',
    filter: PostgresChangeFilter(
      type: PostgresChangeFilterType.eq,
      column: 'room_id',
      value: 200,
    ),
    callback: (PostgresChangePayload payload) {
      final Map<String, dynamic> newRecord = payload.newRecord;
      final Map<String, dynamic> oldRecord = payload.oldRecord;
    })
  .subscribe();
```

---

TITLE: Adding Supabase-kt Modules to Project Build File
DESCRIPTION: This snippet demonstrates how to add Supabase-kt modules (Postgrest, Auth, Realtime) to your project's build configuration using a Bill of Materials (BOM). It provides examples for Gradle Kotlin DSL, Gradle Groovy DSL, and Maven's pom.xml. Replace 'VERSION' with the desired Supabase-kt BOM version.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/docs/ref/kotlin/installing.mdx#_snippet_0

LANGUAGE: kotlin
CODE:

```
implementation(platform("io.github.jan-tennert.supabase:bom:VERSION"))
implementation("io.github.jan-tennert.supabase:postgrest-kt")
implementation("io.github.jan-tennert.supabase:auth-kt")
implementation("io.github.jan-tennert.supabase:realtime-kt")
```

LANGUAGE: groovy
CODE:

```
implementation platform("io.github.jan-tennert.supabase:bom:VERSION")
implementation 'io.github.jan-tennert.supabase:postgrest-kt'
implementation 'io.github.jan-tennert.supabase:auth-kt'
implementation 'io.github.jan-tennert.supabase:realtime-kt'
```

LANGUAGE: xml
CODE:

```
<dependency>
    <groupId>io.github.jan-tennert.supabase</groupId>
    <artifactId>bom</artifactId>
    <version>VERSION</version>
    <type>pom</type>
    <scope>import</scope>
</dependency>
<dependency>
    <groupId>io.github.jan-tennert.supabase</groupId>
    <artifactId>postgrest-kt</artifactId>
</dependency>
<dependency>
    <groupId>io.github.jan-tennert.supabase</groupId>
    <artifactId>auth-kt</artifactId>
</dependency>
<dependency>
    <groupId>io.github.jan-tennert.supabase</groupId>
    <artifactId>realtime-kt</artifactId>
</dependency>
```

---

TITLE: Creating a PostgreSQL Function to Call Edge Function (SQL)
DESCRIPTION: This SQL function `edge.exec` is a PL/pgSQL wrapper that calls the `multi-purpose` Supabase Edge Function. It constructs necessary headers, including authorization and region restrictions, and passes a `code` payload to the Edge Function via the `edge.edge_wrapper` helper.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-11-13-supabase-dynamic-functions.mdx#_snippet_9

LANGUAGE: SQL
CODE:

```
CREATE OR REPLACE FUNCTION edge.exec(data text) RETURNS JSONB LANGUAGE plpgsql
AS $function$
DECLARE
    custom_headers JSONB;
-- Example restricting regions available to Europe
    allowed_regions TEXT[] := ARRAY['eu-west-1', 'eu-west-2', 'eu-west-3', 'eu-north-1', 'eu-central-1'];
BEGIN
    -- Set headers with anon key and Content-Type
    custom_headers := jsonb_build_object(
        'Authorization', 'Bearer ' || edge.get_secret('service_role_key'),
        'Content-Type', 'application/json',
        'x-region', allowed_regions
    );
    -- Call edge_wrapper function with default values
    RETURN edge.edge_wrapper(
        url := ('https://<ref>.supabase.co/functions/v1/multi-purpose'),
        headers := custom_headers,
        payload := jsonb_build_object('code', data),
        max_retries := 5,
        allowed_regions := allowed_regions
    );
END;
$function$;
```

---

TITLE: Implementing Supabase Authentication Service in Angular
DESCRIPTION: This TypeScript service, 'AuthService', encapsulates all Supabase authentication logic for an Angular application. It initializes the Supabase client, manages the current user's session state using a 'BehaviorSubject', and provides methods for user sign-up, sign-in (with password and OTP), password reset, and sign-out. It also handles initial session loading and exposes the current user as an 'Observable' for reactive programming.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-11-08-authentication-in-ionic-angular.mdx#_snippet_8

LANGUAGE: TypeScript
CODE:

```
/* eslint-disable @typescript-eslint/naming-convention */
import { Injectable } from '@angular/core'
import { Router } from '@angular/router'
import { isPlatform } from '@ionic/angular'
import { createClient, SupabaseClient, User } from '@supabase/supabase-js'
import { BehaviorSubject, Observable } from 'rxjs'
import { environment } from '../../environments/environment'

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private supabase: SupabaseClient
  private currentUser: BehaviorSubject<User | boolean> = new BehaviorSubject(null)

  constructor(private router: Router) {
    this.supabase = createClient(environment.supabaseUrl, environment.supabaseKey)

    this.supabase.auth.onAuthStateChange((event, sess) => {
      if (event === 'SIGNED_IN' || event === 'TOKEN_REFRESHED') {
        console.log('SET USER')

        this.currentUser.next(sess.user)
      } else {
        this.currentUser.next(false)
      }
    })

    // Trigger initial session load
    this.loadUser()
  }

  async loadUser() {
    if (this.currentUser.value) {
      // User is already set, no need to do anything else
      return
    }
    const user = await this.supabase.auth.getUser()

    if (user.data.user) {
      this.currentUser.next(user.data.user)
    } else {
      this.currentUser.next(false)
    }
  }

  signUp(credentials: { email; password }) {
    return this.supabase.auth.signUp(credentials)
  }

  signIn(credentials: { email; password }) {
    return this.supabase.auth.signInWithPassword(credentials)
  }

  sendPwReset(email) {
    return this.supabase.auth.resetPasswordForEmail(email)
  }

  async signOut() {
    await this.supabase.auth.signOut()
    this.router.navigateByUrl('/', { replaceUrl: true })
  }

  getCurrentUser(): Observable<User | boolean> {
    return this.currentUser.asObservable()
  }

  getCurrentUserId(): string {
    if (this.currentUser.value) {
      return (this.currentUser.value as User).id
    } else {
      return null
    }
  }

  signInWithEmail(email: string) {
    return this.supabase.auth.signInWithOtp({ email })
  }
}
```

---

TITLE: Creating Categories Table and Linking to Movies (SQL)
DESCRIPTION: This SQL snippet first creates a `categories` table with an auto-generated primary key and a `name` column. It then alters the `movies` table to add a `category_id` column, establishing a one-to-many relationship by referencing the `categories` table's primary key.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/tables.mdx#_snippet_13

LANGUAGE: SQL
CODE:

```
create table categories (
  id bigint generated always as identity primary key,
  name text -- category name
);

alter table movies
  add column category_id bigint references categories;
```

---

TITLE: Initializing Next.js Supabase Starter Template
DESCRIPTION: This command initializes a new Next.js project pre-configured with Supabase support. It includes features like Cookie-based Auth, Tailwind CSS styled authentication forms, and examples for Client Components, Server Components, Route Handlers, and Server Actions, all in TypeScript. It's designed to provide a quick start for building full-stack applications with Supabase.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-08-11-launch-week-8-community-highlights.mdx#_snippet_0

LANGUAGE: bash
CODE:

```
npx create-next-app -e with-supabase
```

---

TITLE: Implementing Supabase Authentication in Next.js Client Component (JavaScript)
DESCRIPTION: This client-side React component demonstrates user authentication flows (sign up, sign in, sign out) using Supabase. It utilizes `createClientComponentClient` to interact with Supabase Auth and `next/navigation` to refresh the router after authentication actions. It requires user email and password inputs.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs.mdx#_snippet_6

LANGUAGE: jsx
CODE:

```
'use client'

import { createClientComponentClient } from '@supabase/auth-helpers-nextjs'
import { useRouter } from 'next/navigation'
import { useState } from 'react'

export default function Login() {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const router = useRouter()
  const supabase = createClientComponentClient()

  const handleSignUp = async () => {
    await supabase.auth.signUp({
      email,
      password,
      options: {
        emailRedirectTo: `${location.origin}/auth/callback`,
      },
    })
    router.refresh()
  }

  const handleSignIn = async () => {
    await supabase.auth.signInWithPassword({
      email,
      password,
    })
    router.refresh()
  }

  const handleSignOut = async () => {
    await supabase.auth.signOut()
    router.refresh()
  }

  return (
    <>
      <input name="email" onChange={(e) => setEmail(e.target.value)} value={email} />
      <input
        type="password"
        name="password"
        onChange={(e) => setPassword(e.target.value)}
        value={password}
      />
      <button onClick={handleSignUp}>Sign up</button>
      <button onClick={handleSignIn}>Sign in</button>
      <button onClick={handleSignOut}>Sign out</button>
    </>
  )
}
```

---

TITLE: Subscribing to Realtime Location Updates with Supabase (React/TypeScript)
DESCRIPTION: This React useEffect hook establishes a Supabase Realtime subscription to listen for INSERT events on the public.locations table, filtered by a specific event_id. Upon receiving new location data, it updates the component's locations state, ensuring the UI reflects the latest live positions. The subscription is cleaned up on component unmount.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-07-04-postgres-realtime-location-sharing-with-maplibre.mdx#_snippet_2

LANGUAGE: tsx
CODE:

```
export default function Page({ params }: { params: { event: string } }) {
  const supabase = createClient<Database>()
  const [locations, setLocations] = useState<{
    [key: string]: Tables<'locations'>
  } | null>(null)
  const locationsRef = useRef<{
    [key: string]: Tables<'locations'>
  } | null>()
  locationsRef.current = locations

  useEffect(() => {
    // Listen to realtime updates
    const subs = supabase
      .channel('schema-db-changes')
      .on(
        'postgres_changes',
        {
          event: 'INSERT', // Listen only to INSERTs
          schema: 'public',
          table: 'locations',
          filter: `event_id=eq.${params.event}`,
        },
        (payload) => {
          const loc = payload.new as Tables<'locations'>
          const updated = {
            ...locationsRef.current,
            [loc.user_id.toString()]: loc,
          }

          setLocations(updated)
        }
      )
      .subscribe()
    console.log('Subscribed')

    return () => {
      subs.unsubscribe()
    }
  }, [])
```

---

TITLE: Granting Read Access to a Supabase Storage Bucket (SQL)
DESCRIPTION: This SQL policy grants read access (SELECT) to all objects within the 'avatars' bucket in Supabase Storage. It leverages Postgres Row Level Security to define who can retrieve objects based on the bucket_id.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2021-03-30-supabase-storage.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
create policy "Read access for avatars."
on storage.objects for select using (
	bucket_id = 'avatars'
);
```

---

TITLE: Creating Supabase Server Client Utility Function - TypeScript
DESCRIPTION: This utility function, `createClient`, is for server-side Supabase interactions in Next.js, specifically for Server Components and Server Actions. It utilizes `createServerClient` from `@supabase/ssr` and integrates with `next/headers` cookies to manage session state, ensuring proper cookie handling for secure server-side operations.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/how-to-migrate-from-supabase-auth-helpers-to-ssr-package-5NRunM.mdx#_snippet_2

LANGUAGE: TypeScript
CODE:

```
// utils/supabase/server.ts
import { createServerClient, type CookieOptions } from '@supabase/ssr';
import { cookies } from 'next/headers';

export function createClient() {
  const cookieStore = cookies();

  return createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return cookieStore.getAll()
        },
        setAll(cookiesToSet) {
          try {
            cookiesToSet.forEach(({ name, value, options }) =>
              cookieStore.set(name, value, options)
            )
          } catch {
            // The `setAll` method was called from a Server Component.
            // This can be ignored if you have middleware refreshing
            // user sessions.
          }
        }
      }
    }
  );
}
```

---

TITLE: Connecting to Supabase with Postgres.js - TypeScript
DESCRIPTION: This step outlines how to create a `db.js` file for database connection using Postgres.js. It emphasizes obtaining connection details from Supabase Database Settings, enabling connection pooling, and setting the `DATABASE_URL` environment variable for secure access.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres-js.mdx#_snippet_1

LANGUAGE: typescript
CODE:

```
// db.js
import postgres from 'postgres'

const connectionString = process.env.DATABASE_URL
const sql = postgres(connectionString)

export default sql
```

---

TITLE: Configuring Supabase Auth Middleware in Next.js (JavaScript)
DESCRIPTION: This JavaScript middleware refreshes the user's Supabase session before Server Component routes are rendered. It creates a Supabase client configured to use cookies and ensures the session remains active by calling `supabase.auth.getUser()`. The `matcher` configuration limits its execution to relevant paths.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs.mdx#_snippet_2

LANGUAGE: js
CODE:

```
import { createMiddlewareClient } from '@supabase/auth-helpers-nextjs'
import { NextResponse } from 'next/server'

export async function middleware(req) {
  const res = NextResponse.next()

  // Create a Supabase client configured to use cookies
  const supabase = createMiddlewareClient({ req, res })

  // Refresh session if expired - required for Server Components
  await supabase.auth.getUser()

  return res
}

// Ensure the middleware is only called for relevant paths.
export const config = {
  matcher: [
    /*
     * Match all request paths except for the ones starting with:
     * - _next/static (static files)
     * - _next/image (image optimization files)
     * - favicon.ico (favicon file)
     * Feel free to modify this pattern to include more paths.
     */
    '/((?!_next/static|_next/image|favicon.ico).*)'
  ]
}
```

---

TITLE: Signing In with LinkedIn (OIDC) using Supabase Flutter Client
DESCRIPTION: This Flutter snippet shows how to perform a LinkedIn (OIDC) sign-in using the Supabase Dart client. It uses `supabase.auth.signInWithOAuth()` with `OAuthProvider.linkedinOidc` and includes optional `redirectTo` and `authScreenLaunchMode` parameters for handling web and mobile redirects/launch modes.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/social-login/auth-linkedin.mdx#_snippet_1

LANGUAGE: Dart
CODE:

```
Future<void> signInWithLinkedIn() async {
  await supabase.auth.signInWithOAuth(
    OAuthProvider.linkedinOidc,
    redirectTo: kIsWeb ? null : 'my.scheme://my-host', // Optionally set the redirect link to bring back the user via deeplink.
    authScreenLaunchMode:
        kIsWeb ? LaunchMode.platformDefault : LaunchMode.externalApplication // Launch the auth screen in a new webview on mobile.
  );
}
```

---

TITLE: Verifying Multi-Factor Authentication (MFA) in Flutter
DESCRIPTION: This snippet provides the Flutter UI and logic for an MFA verification page. Users enter a 6-digit TOTP code from their authenticator app. The code triggers Supabase's MFA flow, including listing factors, challenging a factor, verifying the code, and refreshing the session. Upon successful verification, the user is redirected to the home page, with error handling for authentication issues. It also includes a logout button.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-05-04-flutter-multi-factor-authentication.mdx#_snippet_10

LANGUAGE: Dart
CODE:

```
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mfa_app/main.dart';
import 'package:mfa_app/pages/auth/register_page.dart';
import 'package:mfa_app/pages/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MFAVerifyPage extends StatefulWidget {
  static const route = '/mfa/verify';
  const MFAVerifyPage({super.key});

  @override
  State<MFAVerifyPage> createState() => _MFAVerifyPageState();
}

class _MFAVerifyPageState extends State<MFAVerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify MFA'),
        actions: [
          TextButton(
            onPressed: () {
              supabase.auth.signOut();
              context.go(RegisterPage.route);
            },
            child: Text(
              'Logout',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 24,
        ),
        children: [
          Text(
            'Verification Required',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          const Text('Enter the code shown in your authentication app.'),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              hintText: '000000',
            ),
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            onChanged: (value) async {
              if (value.length != 6) return;

              // kick off the verification process once 6 characters are entered
              try {
                final factorsResponse = await supabase.auth.mfa.listFactors();
                final factor = factorsResponse.totp.first;
                final factorId = factor.id;

                final challenge =
                    await supabase.auth.mfa.challenge(factorId: factorId);
                await supabase.auth.mfa.verify(
                  factorId: factorId,
                  challengeId: challenge.id,
                  code: value,
                );
                await supabase.auth.refreshSession();
                if (mounted) {
                  context.go(HomePage.route);
                }
              } on AuthException catch (error) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(error.message)));
              } catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Unexpected error occurred')));
              }
            },
          ),
        ],
      ),
    );
  }
}
```

---

TITLE: Serving Local Supabase Function (Bash)
DESCRIPTION: This command serves the `elevenlabs-speech-to-text` Supabase Edge Function locally, disabling JWT verification for easier testing and loading environment variables from the specified file.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/edge-functions/supabase/functions/elevenlabs-speech-to-text/README.md#_snippet_2

LANGUAGE: Bash
CODE:

```
supabase functions serve --no-verify-jwt --env-file supabase/functions/.env
```

---

TITLE: Defining Supabase 'todos' Table Schema and Triggers
DESCRIPTION: This SQL code defines the 'todos' table with columns for ID, counter, text, status, and timestamps. It also includes a 'handle_times' trigger function to automatically manage 'created_at' and 'updated_at' timestamps, and enables Realtime for the 'todos' table, which is crucial for Legend-State's synchronization.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-09-23-local-first-expo-legend-state.mdx#_snippet_6

LANGUAGE: sql
CODE:

```
create table todos (
  id uuid default gen_random_uuid() primary key,
  counter bigint generated by default as identity,
  text text,
  done boolean default false,
  created_at timestamptz default now(),
  updated_at timestamptz default now(),
  deleted boolean default false -- needed for soft deletes
);

-- Enable realtime
alter
  publication supabase_realtime add table todos;

-- Legend-State helper to facilitate "Sync only diffs" (changesSince: 'last-sync') mode
CREATE OR REPLACE FUNCTION handle_times()
    RETURNS trigger AS
    $$
    BEGIN
    IF (TG_OP = 'INSERT') THEN
        NEW.created_at := now();
        NEW.updated_at := now();
    ELSEIF (TG_OP = 'UPDATE') THEN
        NEW.created_at = OLD.created_at;
        NEW.updated_at := now();
    END IF;
    RETURN NEW;
    END;
    $$ language plpgsql;

CREATE TRIGGER handle_times
    BEFORE INSERT OR UPDATE ON todos
    FOR EACH ROW
EXECUTE PROCEDURE handle_times();
```

---

TITLE: Creating a Postgres Function for Embeddings (PL/pgSQL)
DESCRIPTION: This PL/pgSQL function, `edge.generate_embedding`, encapsulates the logic for generating text embeddings. It takes `input_text` as a parameter, formats it into a JavaScript string, and executes it via `edge.exec` to interact with the Supabase AI session. The function then extracts and returns the embedding data from the response.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-11-13-supabase-dynamic-functions.mdx#_snippet_12

LANGUAGE: PL/pgSQL
CODE:

```
CREATE OR REPLACE FUNCTION edge.generate_embedding(input_text TEXT) RETURNS JSONB AS $$
DECLARE
    response JSONB;
BEGIN
    -- Call the edge function to generate the embedding for the provided text
    response := edge.exec(
        format(
            $js$
            const session = new Supabase.ai.Session('gte-small');
            return await session.run(%L);
            $js$,
            input_text
        )
    );
    RETURN response->'response'->'data';
END;
$$ LANGUAGE plpgsql;
```

---

TITLE: Enabling Row Level Security (RLS) for a Table - SQL
DESCRIPTION: This SQL command enables Row Level Security (RLS) for a specified table, in this case, 'todos'. Enabling RLS is crucial for restricting access to data based on user authentication tokens and policies, preventing unauthorized access to table rows.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/api/securing-your-api.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
alter table
  todos enable row level security;
```

---

TITLE: Defining User Profiles Table and Row Level Security Policies - SQL
DESCRIPTION: This SQL snippet defines the `profiles` table for user data, including `id`, `updated_at`, `username`, `avatar_url`, and `website`. It then enables Row Level Security (RLS) and creates policies to control access: public viewing, users inserting their own profile, and users updating their own profile. It also sets up Realtime for the `profiles` table and configures a storage bucket for avatars with public access policies.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/user-management/expo-user-management/README.md#_snippet_3

LANGUAGE: sql
CODE:

```
-- Create a table for Public Profiles
create table
  profiles (
    id uuid references auth.users not null,
    updated_at timestamp
    with
      time zone,
      username text unique,
      avatar_url text,
      website text,
      primary key (id),
      unique (username),
      constraint username_length check (char_length(username) >= 3)
  );

alter table
  profiles enable row level security;

create policy "Public profiles are viewable by everyone." on profiles for
select
  using (true);

create policy "Users can insert their own profile." on profiles for insert
with
  check ((select auth.uid()) = id);

create policy "Users can update own profile." on profiles for
update
  using ((select auth.uid()) = id);

-- Set up Realtime!
begin;

drop
  publication if exists supabase_realtime;

create publication supabase_realtime;

commit;

alter
  publication supabase_realtime add table profiles;

-- Set up Storage!
insert into
  storage.buckets (id, name)
values
  ('avatars', 'avatars');

create policy "Avatar images are publicly accessible." on storage.objects for
select
  using (bucket_id = 'avatars');

create policy "Anyone can upload an avatar." on storage.objects for insert
with
  check (bucket_id = 'avatars');
```

---

TITLE: Handling Supabase User Sign-out in Next.js Server Route (JavaScript)
DESCRIPTION: This Next.js Route Handler (POST) processes user sign-out requests. It uses `createRouteHandlerClient` with `next/headers` cookies to interact with Supabase Auth and redirects the user to the login page after successful sign-out. A 301 status is used for redirection from POST to GET.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs.mdx#_snippet_12

LANGUAGE: jsx
CODE:

```
import { createRouteHandlerClient } from '@supabase/auth-helpers-nextjs'
import { cookies } from 'next/headers'
import { NextResponse } from 'next/server'

export async function POST(request) {
  const requestUrl = new URL(request.url)
  const cookieStore = cookies()
  const supabase = createRouteHandlerClient({ cookies: () => cookieStore })

  await supabase.auth.signOut()

  return NextResponse.redirect(`${requestUrl.origin}/login`, {
    status: 301,
  })
}
```

---

TITLE: Handling OAuth and Magic Links with Supabase in React Native
DESCRIPTION: This React Native component demonstrates how to implement OAuth (e.g., GitHub) and magic link authentication using Supabase. It leverages `expo-auth-session` for redirect URI handling and `expo-web-browser` for opening authentication sessions, and `expo-linking` for deep link processing, ensuring proper session creation from callback URLs.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-11-16-react-native-authentication.mdx#_snippet_7

LANGUAGE: tsx
CODE:

```
import { Button } from 'react-native'
import { makeRedirectUri } from 'expo-auth-session'
import * as QueryParams from 'expo-auth-session/build/QueryParams'
import * as WebBrowser from 'expo-web-browser'
import * as Linking from 'expo-linking'
import { supabase } from 'app/utils/supabase'

WebBrowser.maybeCompleteAuthSession() // required for web only
const redirectTo = makeRedirectUri()

const createSessionFromUrl = async (url: string) => {
  const { params, errorCode } = QueryParams.getQueryParams(url)

  if (errorCode) throw new Error(errorCode)
  const { access_token, refresh_token } = params

  if (!access_token) return

  const { data, error } = await supabase.auth.setSession({
    access_token,
    refresh_token,
  })
  if (error) throw error
  return data.session
}

const performOAuth = async () => {
  const { data, error } = await supabase.auth.signInWithOAuth({
    provider: 'github',
    options: {
      redirectTo,
      skipBrowserRedirect: true,
    },
  })
  if (error) throw error

  const res = await WebBrowser.openAuthSessionAsync(data?.url ?? '', redirectTo)

  if (res.type === 'success') {
    const { url } = res
    await createSessionFromUrl(url)
  }
}

const sendMagicLink = async () => {
  const { error } = await supabase.auth.signInWithOtp({
    email: 'example@email.com',
    options: {
      emailRedirectTo: redirectTo,
    },
  })

  if (error) throw error
  // Email sent.
}

export default function Auth() {
  // Handle linking into app from email app.
  const url = Linking.useURL()
  if (url) createSessionFromUrl(url)

  return (
    <>
      <Button onPress={performOAuth} title="Sign in with Github" />
      <Button onPress={sendMagicLink} title="Send Magic Link" />
    </>
  )
}
```

---

TITLE: Querying PostgreSQL with Drizzle ORM and node-postgres in Deno Edge Function
DESCRIPTION: This Deno Edge Function demonstrates connecting to a PostgreSQL database using `node-postgres` and querying data with Drizzle ORM. It defines a 'users' table schema, initializes a PostgreSQL client with a connection string from environment variables, and then uses Drizzle to select all users from the table. The function logs the retrieved users and returns an "ok" response.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-09-12-edge-functions-faster-smaller.mdx#_snippet_2

LANGUAGE: JavaScript
CODE:

```
import { drizzle } from 'npm:drizzle-orm@0.33.0/node-postgres'
import pg from 'npm:pg@8.12.0'
const { Client } = pg

import { pgTable, serial, text, varchar } from 'npm:drizzle-orm@0.33.0/pg-core'

export const users = pgTable('users', {
  id: serial('id').primaryKey(),
  fullName: text('full_name'),
  phone: varchar('phone', { length: 256 }),
})

const client = new Client({
  connectionString: Deno.env.get('SUPABASE_DB_URL'),
})

await client.connect()
const db = drizzle(client)

Deno.serve(async (req) => {
  const allUsers = await db.select().from(users)
  console.log(allUsers)

  return new Response('ok')
})
```

---

TITLE: Authenticated OpenAI Realtime API WebSocket Relay - JavaScript
DESCRIPTION: This snippet demonstrates how to build an authenticated WebSocket relay using Supabase Edge Functions to connect client-side applications to OpenAI's Realtime API. It handles WebSocket upgrades, authenticates users via a JWT provided in the URL query parameters using `supabase.auth.getUser`, and then establishes an outbound WebSocket connection to OpenAI. Messages are relayed between the client and OpenAI, protecting the OpenAI API key and ensuring only authenticated users can access the service.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-12-03-edge-functions-background-tasks-websockets.mdx#_snippet_2

LANGUAGE: JavaScript
CODE:

```
import { createClient } from 'jsr:@supabase/supabase-js@2'

const supabase = createClient(
  Deno.env.get('SUPABASE_URL'),
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')
)
const OPENAI_API_KEY = Deno.env.get('OPENAI_API_KEY')

Deno.serve(async (req) => {
  const upgrade = req.headers.get('upgrade') || ''

  if (upgrade.toLowerCase() != 'websocket') {
    return new Response("request isn't trying to upgrade to websocket.")
  }

  // WebSocket browser clients does not support sending custom headers.
  // We have to use the URL query params to provide user's JWT.
  // Please be aware query params may be logged in some logging systems.
  const url = new URL(req.url)
  const jwt = url.searchParams.get('jwt')
  if (!jwt) {
    console.error('Auth token not provided')
    return new Response('Auth token not provided', { status: 403 })
  }
  const { error, data } = await supabase.auth.getUser(jwt)
  if (error) {
    console.error(error)
    return new Response('Invalid token provided', { status: 403 })
  }
  if (!data.user) {
    console.error('user is not authenticated')
    return new Response('User is not authenticated', { status: 403 })
  }

  const { socket, response } = Deno.upgradeWebSocket(req)

  socket.onopen = () => {
    // initiate an outbound WebSocket connection to OpenAI
    const url = 'wss://api.openai.com/v1/realtime?model=gpt-4o-realtime-preview-2024-10-01'

    // openai-insecure-api-key isn't a problem since this code runs in an Edge Function
    const openaiWS = new WebSocket(url, [
      'realtime',
      `openai-insecure-api-key.${OPENAI_API_KEY}`,
      'openai-beta.realtime-v1',
    ])

    openaiWS.onopen = () => {
      console.log('Connected to OpenAI server.')

      socket.onmessage = (e) => {
        console.log('socket message:', e.data)
        // only send the message if openAI ws is open
        if (openaiWS.readyState === 1) {
          openaiWS.send(e.data)
        } else {
          socket.send(
            JSON.stringify({
              type: 'error',
              msg: 'openAI connection not ready',
            })
          )
        }
      }
    }

    openaiWS.onmessage = (e) => {
      console.log(e.data)
      socket.send(e.data)
    }

    openaiWS.onerror = (e) => console.log('OpenAI error: ', e.message)
    openaiWS.onclose = (e) => console.log('OpenAI session closed')
  }

  socket.onerror = (e) => console.log('socket errored:', e.message)
  socket.onclose = () => console.log('socket closed')

  return response // 101 (Switching Protocols)
})
```

---

TITLE: Creating Documents Table for Retrieval Plugin in SQL
DESCRIPTION: This SQL snippet defines the `documents` table schema, which is used to store chunks of text from various sources along with their metadata. It includes fields for unique identification, source details, content, author, URL, creation timestamp, and a 1536-dimension vector embedding for semantic search.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-05-25-chatgpt-plugins-support-postgres.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
create table if not exists documents (
    id text primary key default gen_random_uuid()::text,
    source text,
    source_id text,
    content text,
    document_id text,
    author text,
    url text,
    created_at timestamptz default now(),
    embedding vector(1536)
);
```

---

TITLE: Checking Subscriber Subscription and Table Replication Status (SQL)
DESCRIPTION: This SQL query provides a detailed view of the status of subscriptions and individual tables on a replica database. It joins pg_subscription and pg_subscription_rel to show the subscription name, table name, and the current replication state (e.g., Initializing, Data Synchronizing, Synchronized, Replicating), along with the last synced LSN, which is critical for monitoring data synchronization progress.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/replication/monitoring-replication.mdx#_snippet_4

LANGUAGE: SQL
CODE:

```
SELECT
    sub.subname AS subscription_name,
    relid::regclass AS table_name,
    srel.srsubstate AS replication_state,
    CASE srel.srsubstate
        WHEN 'i' THEN 'Initializing'
        WHEN 'd' THEN 'Data Synchronizing'
        WHEN 's' THEN 'Synchronized'
        WHEN 'r' THEN 'Replicating'
        ELSE 'Unknown'
    END AS state_description,
    srel.srsyncedlsn AS last_synced_lsn
FROM
    pg_subscription sub
JOIN
    pg_subscription_rel srel ON sub.oid = srel.srsubid
ORDER BY
    table_name;
```

---

TITLE: Retrieving Session with Supabase v2 Async Auth
DESCRIPTION: This snippet demonstrates the new asynchronous `supabase.auth.getSession()` method in Supabase v2. The Auth library has been rebuilt to be async for most methods, resolving race conditions and 'logged out' issues by ensuring the library waits for a valid session.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-08-16-supabase-js-v2.mdx#_snippet_10

LANGUAGE: TypeScript
CODE:

```
// v2
const { data } = await supabase.auth.getSession()
```

---

TITLE: Initializing Supabase Client in JavaScript
DESCRIPTION: This snippet demonstrates how to initialize the Supabase client in JavaScript. It requires the project URL and an anonymous public API key, which can be obtained from the Supabase dashboard. The `createClient` function is used to establish a connection to the Supabase project.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/realtime/broadcast.mdx#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import { createClient } from '@supabase/supabase-js'

const SUPABASE_URL = 'https://<project>.supabase.co'
const SUPABASE_KEY = '<your-anon-key>'

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY)
```

---

TITLE: Defining Todo Table and Row Level Security Policies in Postgres
DESCRIPTION: This SQL snippet defines the `todos` table, including columns for `id`, `user_id`, `task`, `is_complete`, and `inserted_at`. It then enables Row Level Security (RLS) and sets up policies to ensure users can only create, view, update, and delete their own todo items, leveraging Supabase's `auth.uid()` function for user identification.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/todo-list/sveltejs-todo-list/README.md#_snippet_0

LANGUAGE: SQL
CODE:

```
create table todos (
  id bigint generated by default as identity primary key,
  user_id uuid references auth.users not null,
  task text check (char_length(task) > 3),
  is_complete boolean default false,
  inserted_at timestamp with time zone default timezone('utc'::text, now()) not null
);

alter table todos enable row level security;

create policy "Individuals can create todos." on todos for
    insert with check ((select auth.uid()) = user_id);

create policy "Individuals can view their own todos. " on todos for
    select using ((select auth.uid()) = user_id);

create policy "Individuals can update their own todos." on todos for
    update using ((select auth.uid()) = user_id);

create policy "Individuals can delete their own todos." on todos for
    delete using ((select auth.uid()) = user_id);
```

---

TITLE: Generating TypeScript Types for Remote Project
DESCRIPTION: Generates TypeScript type definitions for a remote Supabase project, outputting them to `database.types.ts`. This command requires a project ID and specifies the database schema (e.g., `public`) from which to generate types.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/api/rest/generating-types.mdx#_snippet_3

LANGUAGE: bash
CODE:

```
npx supabase gen types typescript --project-id "$PROJECT_REF" --schema public > database.types.ts
```

---

TITLE: Set up Supabase environment variables in .env.local
DESCRIPTION: Create a `.env.local` file in your project's root directory. Populate it with your Supabase project URL and anonymous key, which are essential for connecting your application to your Supabase backend.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/server-side/nextjs.mdx#_snippet_11

LANGUAGE: txt
CODE:

```
NEXT_PUBLIC_SUPABASE_URL=<your_supabase_project_url>
NEXT_PUBLIC_SUPABASE_ANON_KEY=<your_supabase_anon_key>
```

---

TITLE: Postgres Function for Semantic Search with pgvector in SQL
DESCRIPTION: This PL/pgSQL function, `match_page_sections`, performs a similarity search on the `documents` table using a provided embedding. It allows filtering by source, author, document ID, and creation date, returning the most relevant document chunks based on the inner product distance, which is suitable for normalized OpenAI embeddings.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-05-25-chatgpt-plugins-support-postgres.mdx#_snippet_1

LANGUAGE: SQL
CODE:

```
create or replace function match_page_sections(
	in_embedding vector(1536),
	in_match_count int default 3,
	in_document_id text default '%%',
	in_source_id text default '%%',
	in_source text default '%%',
	in_author text default '%%',
	in_start_date timestamptz default '-infinity',
	in_end_date timestamptz default 'infinity'
)
returns table (
	id text,
	source text,
	source_id text,
	document_id text,
	url text,
	created_at timestamptz,
	author text,
	content text,
	embedding vector(1536),
	similarity float
)
language plpgsql
as $$
#variable_conflict use_variable
begin
return query

select
	documents.id,
	documents.source,
	documents.source_id,
	documents.document_id,
	documents.url,
	documents.created_at,
	documents.author,
	documents.content,
	documents.embedding,
	(documents.embedding <#> in_embedding) * -1 as similarity
from
	documents
where
	in_start_date <= documents.created_at and
  documents.created_at <= in_end_date and
  (documents.source_id like in_source_id or documents.source_id is null) and
  (documents.source like in_source or documents.source is null) and
  (documents.author like in_author or documents.author is null) and
  (documents.document_id like in_document_id or documents.document_id is null)
order by
	documents.embedding <#> in_embedding
limit
	in_match_count;
end;
$$;
```

---

TITLE: Create Supabase client utility functions for Next.js
DESCRIPTION: Provides utility functions to initialize Supabase clients for different execution environments. It includes a client for browser-side (Client Components) and a server-side client for Server Components, Server Actions, and Route Handlers, handling cookie management for user sessions.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/server-side/nextjs.mdx#_snippet_2

LANGUAGE: ts
CODE:

```
import { createBrowserClient } from '@supabase/ssr'

export function createClient() {
  return createBrowserClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
  )
}
```

LANGUAGE: ts
CODE:

```
import { createServerClient } from '@supabase/ssr'
import { cookies } from 'next/headers'

export async function createClient() {
  const cookieStore = await cookies()

  return createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return cookieStore.getAll()
        },
        setAll(cookiesToSet) {
          try {
            cookiesToSet.forEach(({ name, value, options }) =>
              cookieStore.set(name, value, options)
            )
          } catch {
            // The `setAll` method was called from a Server Component.
            // This can be ignored if you have middleware refreshing
            // user sessions.
          }
        }
      }
    }
  )
}
```

---

TITLE: Enabling Row Level Security and Public Access for 'todos' Table (SQL)
DESCRIPTION: This SQL snippet enables Row Level Security (RLS) on the 'todos' table to control data access. It then creates a policy named 'Allow public access' that grants 'anon' (anonymous) users permission to perform SELECT operations on the 'todos' table, making the data publicly readable via the API.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/api/quickstart.mdx#_snippet_1

LANGUAGE: SQL
CODE:

```
-- Turn on security
alter table "todos"
enable row level security;

-- Allow anonymous access
create policy "Allow public access"
  on todos
  for select
  to anon
  using (true);
```

---

TITLE: Creating a PostgreSQL RLS Policy for User-Specific Select
DESCRIPTION: This SQL snippet defines a Row Level Security (RLS) policy named `todo_select_policy` on the `todos` table. It restricts `SELECT` operations, allowing users to only retrieve rows where their authenticated user ID (`auth.uid()`) matches the `user_id` column in the `todos` table. This ensures users can only view their own todo items.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2021-12-01-realtime-row-level-security-in-postgresql.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
create policy todo_select_policy
    on todos for select
    using ( (select auth.uid()) = user_id );
```

---

TITLE: Generating and Using Presigned Upload URLs with Supabase Storage (JavaScript)
DESCRIPTION: This snippet illustrates the process of generating a presigned URL for uploading a file to Supabase Storage. The generated `token` can then be used to perform an upload without requiring direct user authentication, making it suitable for scenarios like server-side generation (e.g., Edge Functions) or delegated uploads.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-04-12-storage-v3-resumable-uploads.mdx#_snippet_2

LANGUAGE: JavaScript
CODE:

```
// create a signed upload url
const filePath = 'users.txt'
const { token } = await storage.from(newBucketName).createSignedUploadUrl(filePath)

// this token can then be used to upload to storage
await storage.from(newBucketName).uploadToSignedUrl(filePath, token, file)
```

---

TITLE: Implementing Supabase Authentication Service in Angular
DESCRIPTION: This Angular service manages user authentication using Supabase. It initializes the Supabase client, tracks the current user's session with a BehaviorSubject, and provides methods for signing in with an email (magic link) and logging out. It also handles initial session loading and listens for authentication state changes.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-08-24-building-a-realtime-trello-board-with-supabase-and-angular.mdx#_snippet_13

LANGUAGE: TypeScript
CODE:

```
import { Injectable } from '@angular/core'
import { Router } from '@angular/router'
import { createClient, SupabaseClient, User } from '@supabase/supabase-js'
import { BehaviorSubject } from 'rxjs'
import { environment } from 'src/environments/environment'

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  private supabase: SupabaseClient
  private _currentUser: BehaviorSubject<boolean | User | any> = new BehaviorSubject(null)

  constructor(private router: Router) {
    this.supabase = createClient(environment.supabaseUrl, environment.supabaseKey)

    // Manually load user session once on page load
    // Note: This becomes a promise with getUser() in the next version!
    const user = this.supabase.auth.user()
    if (user) {
      this._currentUser.next(user)
    } else {
      this._currentUser.next(false)
    }

    this.supabase.auth.onAuthStateChange((event, session) => {
      if (event == 'SIGNED_IN') {
        this._currentUser.next(session!.user)
      } else {
        this._currentUser.next(false)
        this.router.navigateByUrl('/', { replaceUrl: true })
      }
    })
  }

  signInWithEmail(email: string) {
    // Note: This becomes signInWithOTP() in the next version!
    return this.supabase.auth.signIn({
      email,
    })
  }

  logout() {
    this.supabase.auth.signOut()
  }

  get currentUser() {
    return this._currentUser.asObservable()
  }
}
```

---

TITLE: Creating a Table with Primary Key and Foreign Key in Postgres SQL
DESCRIPTION: This snippet demonstrates how to create a 'books' table in PostgreSQL. It defines an 'id' column as a 'bigint' identity primary key, a 'title' column as 'text' and 'not null', and an 'author_id' column as a 'bigint' foreign key referencing the 'authors' table. A comment is also added to describe the table's purpose.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/prompts/code-format-sql.md#_snippet_0

LANGUAGE: SQL
CODE:

```
create table books (
  id bigint generated always as identity primary key,
  title text not null,
  author_id bigint references authors (id)
);
comment on table books is 'A list of all the books in the library.';
```

---

TITLE: Configuring Environment Variables for Supabase (Env)
DESCRIPTION: This snippet shows the required environment variables for connecting a TanStack Start project to Supabase. `VITE_SUPABASE_URL` is the URL of your Supabase project, and `VITE_SUPABASE_ANON_KEY` is the public API key. These values are crucial for initializing the Supabase client.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/ui-library/content/docs/tanstack/password-based-auth.mdx#_snippet_0

LANGUAGE: env
CODE:

```
VITE_SUPABASE_URL=
VITE_SUPABASE_ANON_KEY=
```

---

TITLE: Initializing PGlite Database Schema with pgvector (JavaScript)
DESCRIPTION: This JavaScript code defines functions for managing a PGlite database instance. `getDB` implements a singleton pattern to ensure only one database instance is created, configured with the `pgvector` extension. `initSchema` creates the `embeddings` table with `id`, `content`, and `embedding` columns, and sets up an HNSW index for efficient vector similarity search. `countRows` is a helper to count records in a table.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-08-29-in-browser-semantic-search-pglite.mdx#_snippet_1

LANGUAGE: javascript
CODE:

```
import { PGlite } from '@electric-sql/pglite'
import { vector } from '@electric-sql/pglite/vector'

let dbInstance
// Implement a singleton pattern to make sure we only create one database instance.
export async function getDB() {
  if (dbInstance) {
    return dbInstance
  }
  const metaDb = new PGlite('idb://supa-semantic-search', {
    extensions: {
      vector,
    },
  })
  await metaDb.waitReady
  dbInstance = metaDb
  return metaDb
}

// Initialize the database schema.
export const initSchema = async (db) => {
  return await db.exec(`
    create extension if not exists vector;
    -- drop table if exists embeddings; -- Uncomment this line to reset the database
    create table if not exists embeddings (
      id bigint primary key generated always as identity,
      content text not null,
      embedding vector (384)
    );

    create index on embeddings using hnsw (embedding vector_ip_ops);
  `)
}

// Helper method to count the rows in a table.
export const countRows = async (db, table) => {
  const res = await db.query(`SELECT COUNT(*) FROM ${table};`)
  return res.rows[0].count
}
```

---

TITLE: Implementing Row Level Security Policies in Supabase SQL
DESCRIPTION: This SQL snippet defines Row Level Security (RLS) policies for various tables (`profiles`, `rooms`, `room_participants`, `messages`) in Supabase. It includes a helper function `is_room_participant` to determine if a user is part of a room, enabling fine-grained access control for viewing and inserting data based on user participation.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-11-22-flutter-authorization-with-rls.mdx#_snippet_15

LANGUAGE: SQL
CODE:

```
-- Returns true if the signed in user is a participant of the room
create or replace function is_room_participant(room_id uuid)
returns boolean as $$
  select exists(
    select 1
    from room_participants
    where room_id = is_room_participant.room_id and profile_id = auth.uid()
  );
$$ language sql security definer;


-- *** Row level security polities ***

alter table public.profiles enable row level security;
create policy "Public profiles are viewable by everyone."
  on public.profiles for select using (true);

alter table public.rooms enable row level security;
create policy "Users can view rooms that they have joined"
  on public.rooms for select using (is_room_participant(id));

alter table public.room_participants enable row level security;
create policy "Participants of the room can view other participants."
  on public.room_participants for select using (is_room_participant(room_id));

alter table public.messages enable row level security;
create policy "Users can view messages on rooms they are in."
  on public.messages for select using (is_room_participant(room_id));
create policy "Users can insert messages on rooms they are in."
  on public.messages for insert with check (is_room_participant(room_id) and profile_id = auth.uid());
```

---

TITLE: Creating User Account Management Component (Vue)
DESCRIPTION: Implements the `Account.vue` component for displaying and updating user profile details (username, website, avatar). It fetches existing profile data, handles profile updates using Supabase `upsert`, and provides a sign-out functionality.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-nuxt-3.mdx#_snippet_5

LANGUAGE: vue
CODE:

```
<script setup>
const supabase = useSupabaseClient()

const loading = ref(true)
const username = ref('')
const website = ref('')
const avatar_path = ref('')

loading.value = true
const user = useSupabaseUser()

const { data } = await supabase
  .from('profiles')
  .select(`username, website, avatar_url`)
  .eq('id', user.value.id)
  .single()

if (data) {
  username.value = data.username
  website.value = data.website
  avatar_path.value = data.avatar_url
}

loading.value = false

async function updateProfile() {
  try {
    loading.value = true
    const user = useSupabaseUser()

    const updates = {
      id: user.value.id,
      username: username.value,
      website: website.value,
      avatar_url: avatar_path.value,
      updated_at: new Date()
    }

    const { error } = await supabase.from('profiles').upsert(updates, {
      returning: 'minimal' // Don't return the value after inserting
    })
    if (error) throw error
  } catch (error) {
    alert(error.message)
  } finally {
    loading.value = false
  }
}

async function signOut() {
  try {
    loading.value = true
    const { error } = await supabase.auth.signOut()
    if (error) throw error
    user.value = null
  } catch (error) {
    alert(error.message)
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <form class="form-widget" @submit.prevent="updateProfile">
    <div>
      <label for="email">Email</label>
      <input id="email" type="text" :value="user.email" disabled />
    </div>
    <div>
      <label for="username">Username</label>
      <input id="username" type="text" v-model="username" />
    </div>
    <div>
      <label for="website">Website</label>
      <input id="website" type="url" v-model="website" />
    </div>

    <div>
      <input
        type="submit"
        class="button primary block"
        :value="loading ? 'Loading ...' : 'Update'"
        :disabled="loading"
      />
    </div>

    <div>
      <button class="button block" @click="signOut" :disabled="loading">Sign Out</button>
    </div>
  </form>
</template>
```

---

TITLE: Deploy Supabase Database Changes to Remote
DESCRIPTION: Push your local database schema changes, including new migrations, to your remote Supabase project. This command applies all pending migrations to your hosted database.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/local-development/declarative-database-schemas.mdx#_snippet_10

LANGUAGE: bash
CODE:

```
supabase db push
```

---

TITLE: Generating Insecure Random Numeric User IDs in Python
DESCRIPTION: This Python snippet shows an attempt to generate random numeric user IDs using `random.randrange`. It defines a `create_user` function that assigns a pseudo-random ID to a new `User` object before saving it to the database. This method is insecure for production systems as `random` is a pseudo-random generator, making IDs potentially guessable or prone to collisions if the seed is predictable.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-09-08-choosing-a-postgres-primary-key.mdx#_snippet_6

LANGUAGE: python
CODE:

```
from random import randrange
from models import User
MAX_RANDOM_USER_ID = 1_000_000_000
def create_user():
    """
    Add new user to the database
    """
    user_id = randrange(1, MAX_RANDOM_USER_ID)
    user = User(id=user_id, email="new@example.com", name="new user")
    db.save(user)
```

---

TITLE: Seeding Supabase Vector Collection with Image Embeddings (Python)
DESCRIPTION: Defines the `seed` function, which initializes a Supabase Vector client, creates or retrieves an image vector collection, generates embeddings for sample images using the `encode_image` helper, upserts these embeddings with metadata into the collection, and finally creates an index for efficient search.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-03-26-semantic-image-search-amazon-bedrock.mdx#_snippet_5

LANGUAGE: Python
CODE:

```
def seed():
    # create vector store client
    vx = vecs.create_client(DB_CONNECTION)

    # get or create a collection of vectors with 1024 dimensions
    images = vx.get_or_create_collection(name="image_vectors", dimension=1024)

    # Generate image embeddings with Amazon Titan Model
    img_emb1 = encode_image('./images/one.jpg')
    img_emb2 = encode_image('./images/two.jpg')
    img_emb3 = encode_image('./images/three.jpg')
    img_emb4 = encode_image('./images/four.jpg')

    # add records to the *images* collection
    images.upsert(
        records=[
            (
                "one.jpg",       # the vector's identifier
                img_emb1,        # the vector. list or np.array
                {"type": "jpg"}  # associated  metadata
            ), (
                "two.jpg",
                img_emb2,
                {"type": "jpg"}
            ), (
                "three.jpg",
                img_emb3,
                {"type": "jpg"}
            ), (
                "four.jpg",
                img_emb4,
                {"type": "jpg"}
            )
        ]
    )
    print("Inserted images")

    # index the collection for fast search performance
    images.create_index()
    print("Created index")
```

---

TITLE: Signing In with Email and Password - JavaScript
DESCRIPTION: This snippet demonstrates how to sign in a user using their email and password with the Supabase JavaScript client. It calls `signInWithPassword()` and handles the response, which includes user data or an error.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/passwords.mdx#_snippet_16

LANGUAGE: JavaScript
CODE:

```
import { createClient } from '@supabase/supabase-js'
const supabase = createClient('https://your-project.supabase.co', 'your-anon-key')

// ---cut---
async function signInWithEmail() {
  const { data, error } = await supabase.auth.signInWithPassword({
    email: 'valid.email@supabase.io',
    password: 'example-password',
  })
}
```

---

TITLE: Calling a Supabase RPC with Large Payload - JavaScript
DESCRIPTION: This JavaScript snippet demonstrates how to call the previously defined PostgreSQL `example` function using Supabase's `rpc` method. It shows how to pass a large array of UUIDs as an argument within the request payload, effectively circumventing the 16KB URL/header limit that causes 520 errors. This is the recommended solution for handling large data inputs.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/fixing-520-errors-in-the-database-rest-api-Ur5-B2.mdx#_snippet_4

LANGUAGE: javascript
CODE:

```
const { data, error } = await supabase.rpc('example', { id: ['e2f34fb9-bbf9-4649-9b2f-09ec56e67a42', ...900 more UUIDs] })
```

---

TITLE: Handling Supabase Auth Code Exchange in Next.js Route Handler (TypeScript)
DESCRIPTION: This TypeScript Route Handler (`GET` method) at `app/auth/callback` is responsible for exchanging an authentication `code` for a user session. It uses `createRouteHandlerClient` to create a typed Supabase client with access to cookies, then calls `exchangeCodeForSession` to set the user's session as a cookie, finally redirecting the user back to the application's origin. It includes type imports for `NextRequest` and `Database`.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs.mdx#_snippet_5

LANGUAGE: ts
CODE:

```
import { createRouteHandlerClient } from '@supabase/auth-helpers-nextjs'
import { cookies } from 'next/headers'
import { NextResponse } from 'next/server'

import type { NextRequest } from 'next/server'
import type { Database } from '@/lib/database.types'

export async function GET(request: NextRequest) {
  const requestUrl = new URL(request.url)
  const code = requestUrl.searchParams.get('code')

  if (code) {
    const cookieStore = await cookies()
    const supabase = createRouteHandlerClient<Database>({ cookies: () => cookieStore })
    await supabase.auth.exchangeCodeForSession(code)
  }

  // URL to redirect to after sign in process completes
  return NextResponse.redirect(requestUrl.origin)
}
```

---

TITLE: Creating Composite Index for Multiple Columns in Postgres
DESCRIPTION: This SQL command creates a composite index on both the `sign_up_date` and `priority` columns of the `customers` table. Composite indexes are useful when queries frequently filter or join on multiple columns simultaneously, allowing Postgres to use a single index for efficiency.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/query-optimization.mdx#_snippet_7

LANGUAGE: SQL
CODE:

```
create index idx_customers_sign_up_date_priority on customers (sign_up_date, priority);
```

---

TITLE: Creating Index for JOIN Column in Postgres
DESCRIPTION: This SQL command creates an index on the `customer_id` column of the `orders` table. This index helps optimize join operations between the `customers` and `orders` tables by speeding up the lookup of related records, especially when `a.id` is the primary key of `customers`.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/query-optimization.mdx#_snippet_2

LANGUAGE: SQL
CODE:

```
create index idx_orders_customer_id on orders (customer_id);
```

---

TITLE: Creating Tables for Many-to-Many Relationship (SQL)
DESCRIPTION: This SQL snippet defines three tables: `movies`, `actors`, and `performances`. The `performances` table acts as a join table, linking `movie_id` and `actor_id` with foreign keys, enabling a many-to-many relationship between movies and actors.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/tables.mdx#_snippet_14

LANGUAGE: SQL
CODE:

```
create table movies (
  id bigint generated by default as identity primary key,
  name text,
  description text
);

create table actors (
  id bigint generated by default as identity primary key,
  name text
);

create table performances (
  id bigint generated by default as identity primary key,
  movie_id bigint not null references movies,
  actor_id bigint not null references actors
);
```

---

TITLE: Implementing Supabase Auth Middleware in Next.js (TypeScript)
DESCRIPTION: This middleware function handles Supabase authentication token refreshing and user session management in Next.js. It uses `createServerClient` with the correct `getAll` and `setAll` cookie methods and redirects unauthenticated users to the login page. It's crucial to return the `supabaseResponse` object to prevent session desynchronization.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/prompts/nextjs-supabase-auth.md#_snippet_5

LANGUAGE: typescript
CODE:

```
import { createServerClient } from '@supabase/ssr'
import { NextResponse, type NextRequest } from 'next/server'

export async function middleware(request: NextRequest) {
    let supabaseResponse = NextResponse.next({
    request,
  })

  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return request.cookies.getAll()
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value, options }) => request.cookies.set(name, value))
          supabaseResponse = NextResponse.next({
            request,
          })
          cookiesToSet.forEach(({ name, value, options }) =>
            supabaseResponse.cookies.set(name, value, options)
          )
        }
      }
    }
  )

  // Do not run code between createServerClient and
  // supabase.auth.getUser(). A simple mistake could make it very hard to debug
  // issues with users being randomly logged out.

  // IMPORTANT: DO NOT REMOVE auth.getUser()

  const {
    data: { user }
  } = await supabase.auth.getUser()

  if (
    !user &&
    !request.nextUrl.pathname.startsWith('/login') &&
    !request.nextUrl.pathname.startsWith('/auth')
  ) {
    // no user, potentially respond by redirecting the user to the login page
    const url = request.nextUrl.clone()
    url.pathname = '/login'
    return NextResponse.redirect(url)
  }

  // IMPORTANT: You *must* return the supabaseResponse object as it is.
  // If you're creating a new response object with NextResponse.next() make sure to:
  // 1. Pass the request in it, like so:
  //    const myNewResponse = NextResponse.next({ request })
  // 2. Copy over the cookies, like so:
  //    myNewResponse.cookies.setAll(supabaseResponse.cookies.getAll())
  // 3. Change the myNewResponse object to fit your needs, but avoid changing
  //    the cookies!
  // 4. Finally:
  //    return myNewResponse
  // If this is not done, you may be causing the browser and server to go out
  // of sync and terminate the user's session prematurely!

  return supabaseResponse
}

export const config = {
  matcher: [
    /*
     * Match all request paths except for the ones starting with:
     * - _next/static (static files)
     * - _next/image (image optimization files)
     * - favicon.ico (favicon file)
     * Feel free to modify this pattern to include more paths.
     */
    '/((?!_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*),'
  ]
}
```

---

TITLE: Setting Supabase Environment Variables in Next.js
DESCRIPTION: This snippet demonstrates how to configure Supabase API URL and anonymous key as environment variables in a `.env.local` file. These variables are prefixed with `NEXT_PUBLIC_` to make them accessible on the client-side in a Next.js application, ensuring secure and flexible configuration.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-nextjs.mdx#_snippet_3

LANGUAGE: env
CODE:

```
NEXT_PUBLIC_SUPABASE_URL=YOUR_SUPABASE_URL
NEXT_PUBLIC_SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
```

---

TITLE: Managing User Presence with Supabase Realtime (JavaScript)
DESCRIPTION: This example demonstrates how to use Supabase Realtime's Presence feature to synchronize shared user state, such as a 'user is typing' indicator. It initializes a channel with a presence key, subscribes to presence synchronization events, and tracks user activity (e.g., keyboard events) by sending timestamp updates. It also shows how to retrieve the current presence state and untrack data when no longer needed.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-08-18-supabase-realtime-multiplayer-general-availability.mdx#_snippet_1

LANGUAGE: javascript
CODE:

```
const userId = 'user_1234'
const slackRoomId = '#random'

const channel = supabase.channel(slackRoomId, {
  config: {
    presence: { key: userId }
  }
})

// We can subscribe to all Presence changes using the 'presence' -> 'sync' event.
channel
  .on('presence', { event: 'sync' }, () => presenceChanged())
  .subscribe()

/*
  A contrived example where we bind to all keyboard
  events and send them over our channel
*/
document.addEventListener('keydown', function(event){
  channel.track({ isTyping: Date.now() })
})

// Receive Presence updates
const presenceChanged = () => {
  const newState = channel.presenceState()
  console.log(newState)
}

// When you no longer wish to track data
channel.untrack().then(status => console.log(status)
```

---

TITLE: Authenticated-Only Page with getServerSideProps in Next.js
DESCRIPTION: Demonstrates how to create a page accessible only to authenticated users using `getServerSideProps` in Next.js. It fetches user data from Supabase and redirects unauthenticated users to the home page. Emphasizes using `supabase.auth.getUser()` for secure page protection, as `getSession()` is not guaranteed to revalidate the Auth token on the server.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/server-side/nextjs.mdx#_snippet_18

LANGUAGE: tsx
CODE:

```
import type { User } from '@supabase/supabase-js'
import type { GetServerSidePropsContext } from 'next'

import { createClient } from '@/utils/supabase/server-props'

export default function PrivatePage({ user }: { user: User }) {
  return <h1>Hello, {user.email || 'user'}!</h1>
}

export async function getServerSideProps(context: GetServerSidePropsContext) {
  const supabase = createClient(context)

  const { data, error } = await supabase.auth.getUser()

  if (error || !data) {
    return {
      redirect: {
        destination: '/',
        permanent: false,
      },
    }
  }

  return {
    props: {
      user: data.user,
    },
  }
}
```

---

TITLE: Initiating Client-Side OAuth Sign-In with Supabase JavaScript
DESCRIPTION: This snippet demonstrates how to initiate an OAuth sign-in flow from a client-side (browser) environment using the Supabase JavaScript client. It configures signInWithOAuth to redirect the user to an OAuth provider and then back to a specified callback URL after authentication. The redirectTo URL is crucial for the PKCE flow.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/_partials/oauth_pkce_flow.mdx#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import { createClient, type Provider } from '@supabase/supabase-js';
const supabase = createClient('url', 'anonKey')
const provider = 'provider' as Provider

// ---cut---
await supabase.auth.signInWithOAuth({
  provider,
  options: {
    redirectTo: `http://example.com/auth/callback`,
  },
})
```

---

TITLE: Authenticating with Magic Link (OTP) in Supabase.js v2 (TypeScript)
DESCRIPTION: This snippet shows the new approach for signing in with a magic link (One-Time Password) in Supabase.js v2. The generic `signIn` method is replaced by `signInWithOtp`, making the intent clearer and improving type support for passwordless authentication flows.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/docs/ref/javascript/v1/upgrade-guide.mdx#_snippet_3

LANGUAGE: ts
CODE:

```
const { error } = await supabase
  .auth
  .signIn({ email })
```

LANGUAGE: ts
CODE:

```
const { error } = await supabase
  .auth
  .signInWithOtp({ email })
```

---

TITLE: Configuring Supabase Environment Variables for React
DESCRIPTION: This snippet defines the essential environment variables required for a React application to connect to Supabase. `VITE_SUPABASE_URL` specifies the Supabase project URL, and `VITE_SUPABASE_ANON_KEY` holds the public API key. These variables are crucial for initializing the Supabase client and enabling communication with the backend services.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/ui-library/content/docs/react/password-based-auth.mdx#_snippet_0

LANGUAGE: env
CODE:

```
VITE_SUPABASE_URL=
VITE_SUPABASE_ANON_KEY=
```

---

TITLE: Initializing Supabase Client in Dart
DESCRIPTION: This snippet shows how to initialize the Supabase client in Dart using `supabase_flutter`. The `Supabase.initialize` method sets up the client with the project URL and anonymous public API key. The `supabase` instance is then accessed via `Supabase.instance.client` for further operations.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/realtime/broadcast.mdx#_snippet_1

LANGUAGE: Dart
CODE:

```
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  Supabase.initialize(
    url: 'https://<project>.supabase.co',
    anonKey: '<your-anon-key>',
  );
  runApp(MyApp());
}

final supabase = Supabase.instance.client;
```

---

TITLE: Initializing Supabase in Flutter Main Function
DESCRIPTION: This code initializes the Supabase client within the main function of a Flutter application, ensuring it's ready for use. It sets up the MyApp widget, which uses the appTheme defined in constants.dart and sets SplashPage as the initial home screen. Users need to replace placeholder credentials with their actual Supabase URL and anonymous key.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-06-30-flutter-tutorial-building-a-chat-app.mdx#_snippet_6

LANGUAGE: Dart
CODE:

```
import 'package:flutter/material.dart';
import 'package:my_chat_app/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:my_chat_app/pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    // TODO: Replace credentials with your own
    url: 'SUPABASE_URL',
    anonKey: 'SUPABASE_ANON_KEY',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Chat App',
      theme: appTheme,
      home: const SplashPage(),
    );
  }
}
```

---

TITLE: Creating Row Level Security Policy for Todos (SQL)
DESCRIPTION: This SQL snippet demonstrates how to create a Row Level Security (RLS) policy in PostgreSQL. The policy, named "Individuals can view their own todos.", restricts SELECT access on the public.todos table, allowing users to only view rows where their user_id matches the authenticated user's UID obtained via auth.uid(). This ensures data privacy and prevents unauthorized access to other users' data.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-08-16-vec2pg.mdx#_snippet_0

LANGUAGE: sql
CODE:

```
create policy "Individuals can view their own todos."
  on public.todos
  for select
  using
    ( ( select auth.uid() ) = user_id );
```

---

TITLE: Generating and Storing Embeddings with Transformers.js and Supabase (JavaScript)
DESCRIPTION: This JavaScript snippet demonstrates how to generate a text embedding using `@xenova/transformers` (specifically `Supabase/gte-small` model) and then store it into a PostgreSQL table via the Supabase client. It shows the process of extracting the embedding data and inserting it into the `embedding` column of the `posts` table.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/extensions/pgvector.mdx#_snippet_2

LANGUAGE: JavaScript
CODE:

```
import { pipeline } from '@xenova/transformers'
const generateEmbedding = await pipeline('feature-extraction', 'Supabase/gte-small')

const title = 'First post!'
const body = 'Hello world!'

// Generate a vector using Transformers.js
const output = await generateEmbedding(body, {
  pooling: 'mean',
  normalize: true,
})

// Extract the embedding output
const embedding = Array.from(output.data)

// Store the vector in Postgres
const { data, error } = await supabase.from('posts').insert({
  title,
  body,
  embedding,
})
```

---

TITLE: Importing Drizzle ORM with npm in Edge Functions
DESCRIPTION: This snippet demonstrates how to import an npm module, `drizzle-orm/node-postgres`, directly into a Supabase Edge Function using the `npm:` specifier. This highlights the new native npm compatibility, allowing developers to leverage millions of existing npm packages without an extra build step.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-12-12-edge-functions-node-npm.mdx#_snippet_0

LANGUAGE: jsx
CODE:

```
import { drizzle } from 'npm:drizzle-orm/node-postgres'
```

---

TITLE: Handling CORS and Invoking Supabase Edge Function (TypeScript)
DESCRIPTION: This code demonstrates a Supabase Edge Function that handles CORS preflight requests and processes incoming JSON data. It imports the shared `corsHeaders` and applies them to both the `OPTIONS` preflight response and the main function response, ensuring browser compatibility for API calls.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/functions/cors.mdx#_snippet_1

LANGUAGE: TypeScript
CODE:

```
import { corsHeaders } from '../_shared/cors.ts'

console.log(`Function "browser-with-cors" up and running!`)

Deno.serve(async (req) => {
  // This is needed if you're planning to invoke your function from a browser.
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const { name } = await req.json()
    const data = {
      message: `Hello ${name}!`,
    }

    return new Response(JSON.stringify(data), {
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      status: 200
    })
  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      status: 400
    })
  }
})
```

---

TITLE: Configuring Supabase Database Schema for User Profiles (SQL)
DESCRIPTION: This SQL script defines the 'profiles' table for user data, sets up row-level security policies to control access, enables Realtime updates for the 'profiles' table, and configures a storage bucket named 'avatars' with public access policies for image uploads. It ensures users can manage their own profiles and avatars securely.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/user-management/swift-user-management/README.md#_snippet_0

LANGUAGE: SQL
CODE:

```
-- Create a table for public "profiles"
create table profiles (
  id uuid references auth.users not null,
  updated_at timestamp with time zone,
  username text unique,
  avatar_url text,
  website text,

  primary key (id),
  unique(username),
  constraint username_length check (char_length(username) >= 3)
);

alter table profiles enable row level security;

create policy "Public profiles are viewable by everyone."
  on profiles for select
  using ( true );

create policy "Users can insert their own profile."
  on profiles for insert
  with check ( (select auth.uid()) = id );

create policy "Users can update own profile."
  on profiles for update
  using ( (select auth.uid()) = id );

-- Set up Realtime!
begin;
  drop publication if exists supabase_realtime;
  create publication supabase_realtime;
commit;
alter publication supabase_realtime add table profiles;

-- Set up Storage!
insert into storage.buckets (id, name)
values ('avatars', 'avatars');

create policy "Avatar images are publicly accessible."
  on storage.objects for select
  using ( bucket_id = 'avatars' );

create policy "Anyone can upload an avatar."
  on storage.objects for insert
  with check ( bucket_id = 'avatars' );
```

---

TITLE: Supabase Database Schema and Policies for User Profiles and Storage
DESCRIPTION: This SQL script defines the `profiles` table, linking it to `auth.users` and enforcing a unique username constraint. It establishes Row Level Security (RLS) policies allowing public viewing, self-insertion, and self-updates for user profiles. Additionally, it configures Supabase Realtime for the `profiles` table and sets up an 'avatars' storage bucket with policies for public access and general upload permissions.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/user-management/vue3-user-management/README.md#_snippet_1

LANGUAGE: sql
CODE:

```
-- Create a table for public "profiles"
create table profiles (
  id uuid references auth.users not null,
  updated_at timestamp with time zone,
  username text unique,
  avatar_url text,
  website text,

  primary key (id),
  unique(username),
  constraint username_length check (char_length(username) >= 3)
);

alter table profiles enable row level security;

create policy "Public profiles are viewable by everyone."
  on profiles for select
  using ( true );

create policy "Users can insert their own profile."
  on profiles for insert
  with check ( (select auth.uid()) = id );

create policy "Users can update own profile."
  on profiles for update
  using ( (select auth.uid()) = id );

-- Set up Realtime!
begin;
  drop publication if exists supabase_realtime;
  create publication supabase_realtime;
commit;
alter publication supabase_realtime add table profiles;

-- Set up Storage!
insert into storage.buckets (id, name)
values ('avatars', 'avatars');

create policy "Avatar images are publicly accessible."
  on storage.objects for select
  using ( bucket_id = 'avatars' );

create policy "Anyone can upload an avatar."
  on storage.objects for insert
  with check ( bucket_id = 'avatars' );
```

---

TITLE: Uploading Files to Supabase Storage - Python
DESCRIPTION: This snippet shows how to upload a file to Supabase Storage using the standard upload method in Python. It uses the `supabase.storage.from_().upload()` method to perform the file transfer.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/storage/uploads/standard-uploads.mdx#_snippet_4

LANGUAGE: python
CODE:

```
response = supabase.storage.from_('bucket_name').upload('file_path', file)
```

---

TITLE: Configuring Row Level Security Policies
DESCRIPTION: This SQL snippet establishes Row Level Security (RLS) policies for the `drivers` and `rides` tables. These policies enforce data access control, allowing authenticated users to select driver information, enabling drivers to update their own availability, and restricting ride data access and updates to the involved driver or passenger.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-09-05-flutter-uber-clone.mdx#_snippet_4

LANGUAGE: sql
CODE:

```
alter table public.drivers enable row level security;
create policy "Any authenticated users can select drivers." on public.drivers for select to authenticated using (true);
create policy "Drivers can update their own status." on public.drivers for update to authenticated using (auth.uid() = id);

alter table public.rides enable row level security;
create policy "The driver or the passenger can select the ride." on public.rides for select to authenticated using (driver_id = auth.uid() or passenger_id = auth.uid());
create policy "The driver can update the status. " on public.rides for update to authenticated using (auth.uid() = driver_id);
```

---

TITLE: Fetching Data with RLS (Server-Side) - TypeScript
DESCRIPTION: This TypeScript snippet illustrates server-side data fetching with Supabase and RLS. It uses `createPagesServerClient` within `getServerSideProps` to get an authenticated user session and then queries the 'users' table, enforcing RLS. Unauthenticated users are redirected.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs-pages.mdx#_snippet_13

LANGUAGE: tsx
CODE:

```
import { User, createPagesServerClient } from '@supabase/auth-helpers-nextjs'
import { GetServerSidePropsContext } from 'next'

export default function ProtectedPage({ user, data }: { user: User; data: any }) {
  return (
    <>
      <div>Protected content for {user.email}</div>
      <pre>{JSON.stringify(data, null, 2)}</pre>
      <pre>{JSON.stringify(user, null, 2)}</pre>
    </>
  )
}

export const getServerSideProps = async (ctx: GetServerSidePropsContext) => {
  // Create authenticated Supabase Client
  const supabase = createPagesServerClient(ctx)
  // Check if we have a session
  const {
    data: { user },
  } = await supabase.auth.getUser()

  if (!user)
    return {
      redirect: {
        destination: '/',
        permanent: false,
      },
    }

  // Run queries with RLS on the server
  const { data } = await supabase.from('users').select('*')

  return {
    props: {
      user,
      data: data ?? [],
    },
  }
}
```

---

TITLE: Enabling Row Level Security and MFA Policy (SQL)
DESCRIPTION: This SQL snippet enables Row Level Security (RLS) on the `private_posts` table and defines a policy. The policy restricts `SELECT` access to authenticated users whose Authenticator Assurance Level (`aal`) is 'aal2', meaning they have completed the Multi-Factor Authentication flow.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-05-04-flutter-multi-factor-authentication.mdx#_snippet_12

LANGUAGE: SQL
CODE:

```
-- Enable RLS for private_posts table
alter table
  public.private_posts enable row level security;

-- Create a policy that only allows read if they user has signed in via MFA
create policy "Users can view private_posts if they have signed in via MFA" on public.private_posts for
select
  to authenticated using ((select auth.jwt() - >> 'aal') = 'aal2');
```

---

TITLE: Starting Local Supabase Database (Bash)
DESCRIPTION: This command initializes and starts the local Supabase database services, including the database, storage, and authentication, for local development purposes.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/database/employees/README.md#_snippet_0

LANGUAGE: Bash
CODE:

```
npx supabase db start
```

---

TITLE: Retrieving Current User Session in Supabase.js v2 (TypeScript)
DESCRIPTION: This snippet shows how to retrieve the current user session in Supabase.js v2. The synchronous `session()` method is replaced by the asynchronous `getSession()`, which now returns the `session` object nested within a `data` property, aligning with the new API response structure.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/docs/ref/javascript/v1/upgrade-guide.mdx#_snippet_8

LANGUAGE: ts
CODE:

```
const session = supabase.auth.session()
```

LANGUAGE: ts
CODE:

```
const {
  data: { session },
} = await supabase.auth.getSession()
```

---

TITLE: Performing Data Mutations with Supabase in Next.js Server Actions
DESCRIPTION: This snippet demonstrates how to perform data mutations using Supabase within a Next.js Server Action. The `addTodo` function, marked with `'use server'`, initializes a Supabase client via `createServerActionClient` to insert a new todo item and then revalidates the cache. This showcases server-side data modification capabilities, with the TypeScript version providing type safety for database interactions.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs.mdx#_snippet_18

LANGUAGE: jsx
CODE:

```
import { cookies } from 'next/headers'
import { createServerActionClient } from '@supabase/auth-helpers-nextjs'
import { revalidatePath } from 'next/cache'

export default async function NewTodo() {
  const addTodo = async (formData) => {
    'use server'

    const title = formData.get('title')
    const supabase = createServerActionClient({ cookies })
    await supabase.from('todos').insert({ title })
    revalidatePath('/')
  }

  return (
    <form action={addTodo}>
      <input name="title" />
    </form>
  )
}
```

LANGUAGE: tsx
CODE:

```
import { cookies } from 'next/headers'
import { createServerActionClient } from '@supabase/auth-helpers-nextjs'
import { revalidatePath } from 'next/cache'

import type { Database } from '@/lib/database.types'

export default async function NewTodo() {
  const addTodo = async (formData: FormData) => {
    'use server'

    const title = formData.get('title')
    const cookieStore = cookies()
    const supabase = createServerActionClient<Database>({ cookies: () => cookieStore })
    await supabase.from('todos').insert({ title })
    revalidatePath('/')
  }

  return (
    <form action={addTodo}>
      <input name="title" />
    </form>
  )
}
```

---

TITLE: Creating Postgres Function and Trigger for New User Profiles
DESCRIPTION: This SQL snippet defines a PostgreSQL function `handle_new_user` and a trigger `on_auth_user_created`. The function automatically inserts a new row into the `public.profiles` table with the user's ID and username (extracted from `raw_user_meta_data`) whenever a new user is inserted into `auth.users`. This ensures that every registered user has a corresponding profile entry.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-06-30-flutter-tutorial-building-a-chat-app.mdx#_snippet_11

LANGUAGE: SQL
CODE:

```
-- Function to create a new row in profiles table upon signup
-- Also copies the username value from metadata
create or replace function handle_new_user() returns trigger as $$
    begin
        insert into public.profiles(id, username)
        values(new.id, new.raw_user_meta_data->>'username');

        return new;
    end;
$$ language plpgsql security definer;

-- Trigger to call `handle_new_user` when new user signs up
create trigger on_auth_user_created
    after insert on auth.users
    for each row
    execute function handle_new_user();
```

---

TITLE: Generating a New Supabase Migration File (Bash)
DESCRIPTION: This command generates a new migration file in the `supabase/migrations` directory. This file will store the SQL statements needed to create the `employees` table, serving as the first step in tracking database schema changes.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/deployment/database-migrations.mdx#_snippet_0

LANGUAGE: bash
CODE:

```
supabase migration new create_employees_table
```

---

TITLE: Defining UUID as a Primary Key with Default Generation in PostgreSQL
DESCRIPTION: This snippet illustrates how to create a table where the primary key `id` is of type `uuid` and automatically defaults to a new UUIDv4 generated by `uuid_generate_v4()` upon insertion. This ensures that each new record automatically receives a unique, random identifier.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/extensions/uuid-ossp.mdx#_snippet_2

LANGUAGE: SQL
CODE:

```
create table contacts (
  id uuid default uuid_generate_v4(),
  first_name text,
  last_name text,
  primary key (id)
);
```

---

TITLE: Automating Supabase Type Updates with GitHub Actions Workflow (YAML)
DESCRIPTION: This YAML snippet defines a GitHub Actions workflow that runs daily to automatically update Supabase database types. It checks out the repository, sets up Node.js, runs the `update-types` script defined in `package.json`, checks for file changes, commits any new type definitions, and pushes them back to the repository. It requires `SUPABASE_ACCESS_TOKEN` and `PROJECT_REF` as environment variables.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/api/rest/generating-types.mdx#_snippet_17

LANGUAGE: yaml
CODE:

```
name: Update database types

on:
  schedule:
    # sets the action to run daily. You can modify this to run the action more or less frequently
    - cron: '0 0 * * *'

jobs:
  update:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    env:
      SUPABASE_ACCESS_TOKEN: ${{ secrets.ACCESS_TOKEN }}
      PROJECT_REF: <your-project-id>
    steps:
      - uses: actions/checkout@v4
        with:
          persist-credentials: false
          fetch-depth: 0
      - uses: actions/setup-node@v4
        with:
          node-version: 22
      - run: npm run update-types
      - name: check for file changes
        id: git_status
        run: |
          echo "status=$(git status -s)" >> $GITHUB_OUTPUT
      - name: Commit files
        if: ${{contains(steps.git_status.outputs.status, ' ')}}
        run: |
          git add database.types.ts
          git config --local user.email "41898282+github-actions[bot]@users.noreply.github.com"
          git config --local user.name "github-actions[bot]"
          git commit -m "Update database types" -a
      - name: Push changes
        if: ${{contains(steps.git_status.outputs.status, ' ')}}
        uses: ad-m/github-push-action@master
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          branch: ${{ github.ref }}
```

---

TITLE: Deploying Edge Functions with GitHub Actions
DESCRIPTION: This GitHub Action workflow automates the deployment of Supabase Edge Functions whenever code is merged into the `main` branch or manually triggered. It uses `setup-cli` to install the Supabase CLI and then deploys functions using the `supabase functions deploy` command, requiring `SUPABASE_ACCESS_TOKEN` and `PROJECT_ID` environment variables.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/functions/cicd-workflow.mdx#_snippet_0

LANGUAGE: yaml
CODE:

```
name: Deploy Function

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  deploy:
    runs-on: ubuntu-latest

    env:
      SUPABASE_ACCESS_TOKEN: ${{ secrets.SUPABASE_ACCESS_TOKEN }}
      PROJECT_ID: your-project-id

    steps:
      - uses: actions/checkout@v4

      - uses: supabase/setup-cli@v1
        with:
          version: latest

      - run: supabase functions deploy --project-ref $PROJECT_ID
```

---

TITLE: Configuring GitHub Action for Documentation Embeddings (YAML)
DESCRIPTION: This YAML configuration defines a GitHub Actions workflow that automatically generates and updates documentation embeddings in a Supabase database on every push to the main branch. It uses the `supabase/embeddings-generator` action, requiring Supabase project URL, service role key, and OpenAI API key as secrets, along with the root path to the markdown files.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/examples/headless-vector-search.mdx#_snippet_0

LANGUAGE: YAML
CODE:

```
name: 'generate_embeddings'
on: # run on main branch changes
  push:
    branches:
      - main

jobs:
  generate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: supabase/embeddings-generator@v0.0.x # Update this to the latest version.
        with:
          supabase-url: 'https://your-project-ref.supabase.co' # Update this to your project URL.
          supabase-service-role-key: ${{ secrets.SUPABASE_SERVICE_ROLE_KEY }}
          openai-key: ${{ secrets.OPENAI_API_KEY }}
          docs-root-path: 'docs' # the path to the root of your md(x) files
```

---

TITLE: Serving Supabase Edge Functions in Debug Mode (Shell)
DESCRIPTION: This command serves Supabase Edge Functions locally with the v8 inspector protocol enabled. The `--inspect-mode brk` flag ensures that script execution pauses at the very first line, allowing DevTools to attach and control the debugging flow from the start. This is a prerequisite for debugging with Chrome DevTools.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/functions/debugging-tools.mdx#_snippet_0

LANGUAGE: Shell
CODE:

```
supabase functions serve --inspect-mode brk
```

---

TITLE: Adding Admin Role to JWT Claims (SQL)
DESCRIPTION: This SQL function implements a custom access token hook that checks if a user is an administrator based on an `is_admin` flag in a `profiles` table. If the user is an admin, it adds an `admin: true` claim to their `app_metadata` within the JWT, allowing for restricted actions. It also includes DDL for the `profiles` table and grants/revokes for permissions.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-hooks/custom-access-token-hook.mdx#_snippet_3

LANGUAGE: SQL
CODE:

```
create table profiles (
  user_id uuid not null primary key references auth.users (id),
  is_admin boolean not null default false
);
```

LANGUAGE: SQL
CODE:

```
create or replace function public.custom_access_token_hook(event jsonb)
returns jsonb
language plpgsql
as $$
  declare
    claims jsonb;
    is_admin boolean;
  begin
    -- Check if the user is marked as admin in the profiles table
    select is_admin into is_admin from profiles where user_id = (event->>'user_id')::uuid;

    -- Proceed only if the user is an admin
    if is_admin then
      claims := event->'claims';

      -- Check if 'app_metadata' exists in claims
      if jsonb_typeof(claims->'app_metadata') is null then
        -- If 'app_metadata' does not exist, create an empty object
        claims := jsonb_set(claims, '{app_metadata}', '{}');
      end if;

      -- Set a claim of 'admin'
      claims := jsonb_set(claims, '{app_metadata, admin}', 'true');

      -- Update the 'claims' object in the original event
      event := jsonb_set(event, '{claims}', claims);
    end if;

    -- Return the modified or original event
    return event;
  end;
$$;
```

LANGUAGE: SQL
CODE:

```
grant all
  on table public.profiles
  to supabase_auth_admin;

revoke all
  on table public.profiles
  from authenticated, anon, public;
```

---

TITLE: Starting Local Supabase Stack - Shell
DESCRIPTION: This command initializes and runs the entire Supabase stack, including a Postgres database, locally on your development machine. It's used for local experimentation and development, providing a complete environment for testing.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-12-13-supabase-branching.mdx#_snippet_0

LANGUAGE: Shell
CODE:

```
supabase start
```

---

TITLE: Querying Embeddings via RPC in Supabase Edge Function - TypeScript
DESCRIPTION: This TypeScript Edge Function handles search queries. It first generates an embedding for the user's `search` term using the `gte-small` model. Then, it invokes the `query_embeddings` Postgres function via Supabase's RPC client to find and retrieve relevant content from the database based on vector similarity, returning the top 3 results.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/functions/examples/semantic-search.mdx#_snippet_3

LANGUAGE: TypeScript
CODE:

```
const model = new Supabase.ai.Session('gte-small')

Deno.serve(async (req) => {
  const { search } = await req.json()
  if (!search) return new Response('Please provide a search param!')
  // Generate embedding for search term.
  const embedding = await model.run(search, {
    mean_pool: true,
    normalize: true,
  })

  // Query embeddings.
  const { data: result, error } = await supabase
    .rpc('query_embeddings', {
      embedding,
      match_threshold: 0.8,
    })
    .select('content')
    .limit(3)
  if (error) {
    return Response.json(error)
  }

  return Response.json({ search, result })
})
```

---

TITLE: Implementing Row Level Security Policies - SQL
DESCRIPTION: This SQL snippet enables Row Level Security (RLS) for `boards`, `user_boards`, `lists`, and `cards` tables. It defines policies to control data access, ensuring users can only create, view, update, or delete records they are authorized for, often leveraging the `get_boards_for_authenticated_user` function.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-08-24-building-a-realtime-trello-board-with-supabase-and-angular.mdx#_snippet_1

LANGUAGE: SQL
CODE:

```
-- boards row level security
alter table boards enable row level security;

-- Policies
create policy "Users can create boards" on boards for
  insert to authenticated with CHECK (true);

create policy "Users can view their boards" on boards for
    select using (
      id in (
        select get_boards_for_authenticated_user()
      )
    );

create policy "Users can update their boards" on boards for
    update using (
      id in (
        select get_boards_for_authenticated_user()
      )
    );

create policy "Users can delete their created boards" on boards for
    delete using ((select auth.uid()) = creator);

-- user_boards row level security
alter table user_boards enable row level security;

create policy "Users can add their boards" on user_boards for
    insert to authenticated with check (true);

create policy "Users can view boards" on user_boards for
    select using ((select auth.uid()) = user_id);

create policy "Users can delete their boards" on user_boards for
    delete using ((select auth.uid()) = user_id);

-- lists row level security
alter table lists enable row level security;

-- Policies
create policy "Users can edit lists if they are part of the board" on lists for
    all using (
      board_id in (
        select get_boards_for_authenticated_user()
      )
    );

-- cards row level security
alter table cards enable row level security;

-- Policies
create policy "Users can edit cards if they are part of the board" on cards for
    all using (
      board_id in (
        select get_boards_for_authenticated_user()
      )
    );
```

---

TITLE: Creating Authenticated Supabase Client in Remix Action (TypeScript)
DESCRIPTION: This Remix action function demonstrates how to create an authenticated Supabase client on the server-side for handling non-GET HTTP requests using TypeScript. It uses `createServerClient` with environment variables and the request/response objects, allowing data manipulation or fetching from Supabase. The `response.headers` must be returned to manage the user's authentication session via cookies.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/remix.mdx#_snippet_7

LANGUAGE: TypeScript
CODE:

```
import { json } from '@remix-run/node' // change this import to whatever runtime you are using
import { createServerClient } from '@supabase/auth-helpers-remix'

import type { ActionFunctionArgs } from '@remix-run/node' // change this import to whatever runtime you are using

export const action = async ({ request }: ActionFunctionArgs) => {
  const response = new Response()

  const supabaseClient = createServerClient(
    process.env.SUPABASE_URL!,
    process.env.SUPABASE_ANON_KEY!,
    { request, response }
  )

  const { data } = await supabaseClient.from('test').select('*')

  return json(
    { data },
    {
      headers: response.headers,
    }
  )
}
```

---

TITLE: Initializing Supabase Client with AsyncStorage in React Native - TypeScript
DESCRIPTION: This TypeScript snippet demonstrates how to initialize the Supabase client in a React Native application. It imports `AsyncStorage` for session management and `createClient` from `@supabase/supabase-js`. The client is configured with the Supabase URL and public key from environment variables, and `AsyncStorage` is set as the storage mechanism for authentication sessions, ensuring persistent user logins.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-08-01-react-native-storage.mdx#_snippet_3

LANGUAGE: TypeScript
CODE:

```
import AsyncStorage from '@react-native-async-storage/async-storage'
import 'react-native-url-polyfill/auto'

import { createClient } from '@supabase/supabase-js'

const url = process.env.EXPO_PUBLIC_SUPABASE_URL
const key = process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY

// Initialize the Supabase client
export const supabase = createClient(url, key, {
  auth: {
    storage: AsyncStorage,
    detectSessionInUrl: false,
  },
})
```

---

TITLE: Implementing Next.js Root Middleware for Supabase (JavaScript)
DESCRIPTION: This `middleware.js` file at the project root defines the Next.js middleware responsible for updating the user's authentication session. It imports `updateSession` from a utility file and applies it to all relevant request paths using a matcher configuration, ensuring session freshness across server components.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-nextjs.mdx#_snippet_7

LANGUAGE: javascript
CODE:

```
import { updateSession } from '@/utils/supabase/middleware'

export async function middleware(request) {
  // update user's auth session
  return await updateSession(request)
}

export const config = {
  matcher: [
    /*
     * Match all request paths except for the ones starting with:
     * - _next/static (static files)
     * - _next/image (image optimization files)
     * - favicon.ico (favicon file)
     * Feel free to modify this pattern to include more paths.
     */
    '/((?!_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)'
  ]
}
```

---

TITLE: Defining Application Schema Tables in SQL
DESCRIPTION: This snippet defines the core database tables for a Supabase application, including `profiles`, `organizations`, `org_members`, `posts`, and `comments`. Each table includes primary keys, foreign key relationships, data types, default values, and constraints to ensure data integrity and structure the application's data model.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/local-development/testing/pgtap-extended.mdx#_snippet_6

LANGUAGE: SQL
CODE:

```
create table public.profiles (
  id uuid references auth.users(id) primary key,
  username text unique not null,
  full_name text,
  bio text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table public.organizations (
  id bigint primary key generated always as identity,
  name text not null,
  slug text unique not null,
  plan_type text not null check (plan_type in ('free', 'pro', 'enterprise')),
  max_posts int not null default 5,
  created_at timestamptz default now()
);

create table public.org_members (
  org_id bigint references public.organizations(id) on delete cascade,
  user_id uuid references auth.users(id) on delete cascade,
  role text not null check (role in ('owner', 'admin', 'editor', 'viewer')),
  created_at timestamptz default now(),
  primary key (org_id, user_id)
);

create table public.posts (
  id bigint primary key generated always as identity,
  title text not null,
  content text not null,
  author_id uuid references public.profiles(id) not null,
  org_id bigint references public.organizations(id),
  status text not null check (status in ('draft', 'published', 'archived')),
  is_premium boolean default false,
  scheduled_for timestamptz,
  category text,
  view_count int default 0,
  published_at timestamptz,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table public.comments (
  id bigint primary key generated always as identity,
  post_id bigint references public.posts(id) on delete cascade,
  author_id uuid references public.profiles(id),
  content text not null,
  is_deleted boolean default false,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);
```

---

TITLE: Creating Next.js App with Supabase Template (Bash)
DESCRIPTION: This command initializes a new Next.js application using `create-next-app`. It leverages the `with-supabase` example template, which pre-configures the project with cookie-based authentication, TypeScript, and Tailwind CSS, streamlining the setup process for Supabase integration.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/quickstarts/nextjs.mdx#_snippet_1

LANGUAGE: Bash
CODE:

```
npx create-next-app -e with-supabase
```

---

TITLE: Signing Out from Supabase Auth (Flutter)
DESCRIPTION: This snippet shows how to sign out a user using the Supabase Flutter client. The `supabase.auth.signOut()` method is used to end the user's session and clear any stored authentication data.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/social-login/auth-keycloak.mdx#_snippet_4

LANGUAGE: Dart
CODE:

```
Future<void> signOut() async {
  await supabase.auth.signOut();
}
```

---

TITLE: Signing Out from Supabase Auth (JavaScript)
DESCRIPTION: This snippet demonstrates how to sign out a user from their Supabase session using the JavaScript client. Calling `supabase.auth.signOut()` terminates the user's session and removes any related objects from local storage.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/social-login/auth-keycloak.mdx#_snippet_3

LANGUAGE: JavaScript
CODE:

```
async function signOut() {
  const { error } = await supabase.auth.signOut()
}
```

---

TITLE: Generating Supabase TypeScript Types via CLI
DESCRIPTION: Commands to start the Supabase local services and generate TypeScript type definitions from the local database schema using the Supabase CLI.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/docs/ref/javascript/release-notes.mdx#_snippet_4

LANGUAGE: bash
CODE:

```
supabase start
supabase gen types typescript --local > DatabaseDefinitions.ts
```

---

TITLE: Creating Row Level Security Policy for User-Specific Inserts in PostgreSQL
DESCRIPTION: This SQL statement creates a Row Level Security (RLS) policy named 'Individuals can only write their own messages.' on the `messages` table. The policy restricts `INSERT` operations, ensuring that a new message can only be inserted if the `user_id` of the message matches the authenticated user's UID, typically obtained from a JWT via `auth.uid()`.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2021-02-27-cracking-postgres-interview.mdx#_snippet_4

LANGUAGE: SQL
CODE:

```
CREATE POLICY "Individuals can only write their own messages." ON messages FOR
    INSERT WITH CHECK ((select auth.uid()) = user_id);
```

---

TITLE: Handling Supabase Email OTP Confirmation in Remix
DESCRIPTION: This Remix loader function (`app/routes/auth.confirm.tsx`) is responsible for verifying Supabase email OTPs. It extracts `token_hash` and `type` from the request URL, sets up a server-side Supabase client with cookie management, verifies the OTP, and redirects the user to the `next` URL with appropriate headers on success, or to an error page on failure.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/passwords.mdx#_snippet_9

LANGUAGE: TypeScript
CODE:

```
import { redirect, type LoaderFunctionArgs } from '@remix-run/node'
import { createServerClient, parseCookieHeader, serializeCookieHeader } from '@supabase/ssr'
import { type EmailOtpType } from '@supabase/supabase-js'

export async function loader({ request }: LoaderFunctionArgs) {
  const requestUrl = new URL(request.url)
  const token_hash = requestUrl.searchParams.get('token_hash')
  const type = requestUrl.searchParams.get('type') as EmailOtpType | null
  const next = requestUrl.searchParams.get('next') || '/'
  const headers = new Headers()

  if (token_hash && type) {
    const supabase = createServerClient(process.env.SUPABASE_URL!, process.env.SUPABASE_ANON_KEY!, {
      cookies: {
        getAll() {
          return parseCookieHeader(request.headers.get('Cookie') ?? '')
        },
        setAll(key, value, options) {
          headers.append('Set-Cookie', serializeCookieHeader(key, value, options))
        }
      }
    })

    const { error } = await supabase.auth.verifyOtp({
      type,
      token_hash,
    })

    if (!error) {
      return redirect(next, { headers })
    }
  }

  // return the user to an error page with instructions
  return redirect('/auth/auth-code-error', { headers })
}
```

---

TITLE: Signing In with Facebook using Supabase JS Client
DESCRIPTION: This snippet demonstrates how to initiate the Facebook OAuth sign-in process using the Supabase JavaScript client. It calls `supabase.auth.signInWithOAuth()` with `provider: 'facebook'`, which redirects the user to the Facebook authentication page to complete the login.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/social-login/auth-facebook.mdx#_snippet_0

LANGUAGE: JavaScript
CODE:

```
import { createClient } from '@supabase/supabase-js'
const supabase = createClient('https://your-project.supabase.co', 'your-anon-key')

async function signInWithFacebook() {
  const { data, error } = await supabase.auth.signInWithOAuth({
    provider: 'facebook',
  })
}
```

---

TITLE: Subscribing to All Schema Changes (JavaScript)
DESCRIPTION: This JavaScript code subscribes to all changes (`event: '*'`) within the `public` schema using the Supabase Realtime client. It logs the payload of any database event.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/realtime/postgres-changes.mdx#_snippet_6

LANGUAGE: js
CODE:

```
const changes = supabase
  .channel('schema-db-changes')
  .on(
    'postgres_changes',
    {
      schema: 'public', // Subscribes to the "public" schema in Postgres
      event: '*',       // Listen to all changes
    },
    (payload) => console.log(payload)
  )
  .subscribe()
```

---

TITLE: Signing Out with Supabase using Kotlin
DESCRIPTION: This suspend function facilitates user sign-out within a Kotlin application. It calls `supabase.auth.signOut()` to end the current user session and remove session-related data.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/social-login/auth-kakao.mdx#_snippet_5

LANGUAGE: Kotlin
CODE:

```
suspend fun signOut() {
	supabase.auth.signOut()
}
```

---

TITLE: Initializing Supabase Client in JavaScript
DESCRIPTION: This code initializes the Supabase client using the `createClient` method. It requires the Supabase project URL and the anonymous (anon) public key, which are obtained from the Supabase dashboard's API settings. This client instance is then used for all database interactions.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2021-03-11-using-supabase-replit.mdx#_snippet_1

LANGUAGE: JavaScript
CODE:

```
const supabase = createClient(
  'https://ajsstlnzcmdmzbtcgbbd.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...'
)
```

---

TITLE: Starting Local Supabase Stack
DESCRIPTION: This command starts the local Supabase development stack, which includes the PostgreSQL database, authentication, and other services. It prints out essential environment details, including the local database URL, required for connecting your application.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/examples/image-search-openai-clip.mdx#_snippet_3

LANGUAGE: shell
CODE:

```
supabase start
```

---

TITLE: Setting Environment Variables for Supabase API Keys - Bash
DESCRIPTION: This snippet demonstrates how to set Supabase API credentials and project URL as environment variables in a Bash or Zsh shell. These variables (`SUPABASE_URL`, `SUPABASE_KEY`, `SUPABASE_SECRET_KEY`) are crucial for authenticating and connecting to your Supabase project from the Python SDK.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-06-15-loading-data-supabase-python.mdx#_snippet_0

LANGUAGE: bash
CODE:

```
export <variable_name>=<variable_value>
export SUPABASE_URL=<<the value under config > URL>>
export SUPABASE_KEY=<<the value present in Project API keys > anon public>>
export SUPABASE_SECRET_KEY=<<the value present in Project API keys > service_role secret>>
```

---

TITLE: Creating User Profile Insertion Function and Trigger in Supabase - SQL
DESCRIPTION: This SQL snippet defines an `insert_user` PL/pgSQL function and an `on_new_auth_create_profile` trigger. The trigger automatically inserts a new entry into `public.profiles` with the user's ID and email whenever a new user is created in `auth.users`, ensuring profile data synchronization. Necessary grants are also provided.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/realtime/nextjs-authorization-demo/README.md#_snippet_2

LANGUAGE: SQL
CODE:

```
CREATE OR REPLACE FUNCTION insert_user() RETURNS TRIGGER AS
$$
  BEGIN
    INSERT INTO public.profiles (id, email) VALUES (NEW.id, NEW.email); RETURN NEW;
  END;
$$ LANGUAGE plpgsql
   SECURITY DEFINER
   SET search_path = public;

CREATE OR REPLACE TRIGGER "on_new_auth_create_profile"
AFTER INSERT ON auth.users FOR EACH ROW
EXECUTE FUNCTION insert_user();

GRANT EXECUTE ON FUNCTION insert_user () TO supabase_auth_admin;
GRANT INSERT ON TABLE public.profiles TO supabase_auth_admin;
```

---

TITLE: Installing Supabase CLI
DESCRIPTION: This snippet provides commands to install the Supabase CLI using various package managers or Homebrew. The CLI is essential for managing local Supabase projects and interacting with the Supabase platform.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/local-development.mdx#_snippet_0

LANGUAGE: sh
CODE:

```
npm install supabase --save-dev
```

LANGUAGE: sh
CODE:

```
yarn add supabase --dev
```

LANGUAGE: sh
CODE:

```
pnpm add supabase --save-dev --allow-build=supabase
```

LANGUAGE: sh
CODE:

```
brew install supabase/tap/supabase
```

---

TITLE: Defining the Employees Table Schema (SQL)
DESCRIPTION: This SQL snippet defines the schema for the `employees` table. It includes columns for `id` (primary key), `name`, `email`, and `created_at`, ensuring the table is created only if it doesn't already exist.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/deployment/database-migrations.mdx#_snippet_1

LANGUAGE: sql
CODE:

```
create table if not exists employees (
  id bigint primary key generated always as identity,
  name text not null,
  email text,
  created_at timestamptz default now()
);
```

---

TITLE: Creating a B-Tree Index on Persons Age - PostgreSQL
DESCRIPTION: Creates a standard B-Tree index named `idx_persons_age` on the `age` column of the `persons` table. This index is designed to speed up queries that filter or sort by the `age` column.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/indexes.mdx#_snippet_3

LANGUAGE: SQL
CODE:

```
create index idx_persons_age on persons (age);
```

---

TITLE: Configuring `signUp` with `emailRedirectTo` in Supabase Auth
DESCRIPTION: This snippet demonstrates how to configure the `signUp` function in Supabase Auth to use a `emailRedirectTo` URL. The `emailRedirectTo` option must be set to the new code exchange Route Handler, typically `/auth/callback`, to handle authentication redirects properly. It shows an example with a placeholder email and password, directing the user to `http://localhost:3000/auth/callback` after sign-up.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs.mdx#_snippet_29

LANGUAGE: JavaScript
CODE:

```
supabase.auth.signUp({
  email: 'valid.email@supabase.io',
  password: 'sup3rs3cur3',
  options: {
    emailRedirectTo: 'http://localhost:3000/auth/callback'
  }
})
```

---

TITLE: Creating Films Table and Row Level Security in PostgreSQL
DESCRIPTION: This SQL snippet defines the `films` table in a PostgreSQL database, enabling the `pgvector` extension for vector embeddings. It includes columns for movie details and an `embedding` vector. Row-level security is enabled, and a policy is created to allow public read access to the `films` table.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-02-26-content-recommendation-with-flutter.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
-- Enable pgvector extension
create extension vector
with
  schema extensions;

-- Create table
create table public.films (
  id integer primary key,
  title text,
  overview text,
  release_date date,
  backdrop_path text,
  embedding vector(1536)
);

-- Enable row level security
alter table public.films enable row level security;

-- Create policy to allow anyone to read the films table
create policy "Fils are public." on public.films for select using (true);
```

---

TITLE: Generate and Apply Supabase Database Migrations
DESCRIPTION: Creates a new SQL migration file reflecting local database schema changes using `supabase db diff`. Includes instructions for resetting the local database to apply manual migration edits.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/deployment/branching.mdx#_snippet_5

LANGUAGE: bash
CODE:

```
supabase db diff -f "add_employees_table"
```

LANGUAGE: bash
CODE:

```
supabase db reset
```

---

TITLE: Querying User Data With Row Level Security (RLS) in JavaScript
DESCRIPTION: This snippet illustrates a simplified data query when Row Level Security (RLS) policies are enabled on the PostgreSQL database. With RLS, the application no longer needs to explicitly filter by `user_id`, as the database automatically enforces authorization rules, returning only the rows the authenticated user is permitted to access.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2020-08-05-supabase-auth.mdx#_snippet_1

LANGUAGE: JavaScript
CODE:

```
let user = await supabase.from('users').select('user_id, name')\n
// Still returns { id: 'd0714948', name: 'Jane' }
```

---

TITLE: Signing Out with Specific Scopes in Supabase
DESCRIPTION: This snippet illustrates how to use different sign-out scopes (`global`, `local`, `others`) to control which user sessions are terminated. The `global` scope terminates all sessions, `local` terminates only the current session, and `others` terminates all but the current session.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/signout.mdx#_snippet_1

LANGUAGE: JavaScript
CODE:

```
import { createClient } from '@supabase/supabase-js'
const supabase = createClient('https://your-project-id.supabase.co', 'your-anon-key')

// defaults to the global scope
await supabase.auth.signOut()

// sign out from the current session only
await supabase.auth.signOut({ scope: 'local' })
```

LANGUAGE: Dart
CODE:

```
// defaults to the local scope
await supabase.auth.signOut();

// sign out from all sessions
await supabase.auth.signOut(scope: SignOutScope.global);
```

LANGUAGE: Kotlin
CODE:

```
// defaults to the local scope
await supabase.auth.signOut();

// sign out from all sessions
supabase.auth.signOut(SignOutScope.GLOBAL)
```

---

TITLE: Generate Database Migration from Declared Schema
DESCRIPTION: Generates a new migration file by comparing the current database state with the declared schema, naming the migration 'create_employees_table'. This command should be run after defining your schema and before starting the local database.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/local-development/declarative-database-schemas.mdx#_snippet_1

LANGUAGE: bash
CODE:

```
supabase db diff -f create_employees_table
```

---

TITLE: Implementing Supabase Login and Signup Server Actions - TypeScript
DESCRIPTION: This snippet defines server actions for user authentication (login and signup) using Supabase within a Next.js application. It retrieves email and password from form data, calls `signInWithPassword` or `signUp` via the server-side Supabase client, and redirects to an error page on failure or the home page on success, revalidating the path.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/how-to-migrate-from-supabase-auth-helpers-to-ssr-package-5NRunM.mdx#_snippet_5

LANGUAGE: TypeScript
CODE:

```
// app/login/actions.ts

'use server';

import { revalidatePath } from 'next/cache';
import { redirect } from 'next/navigation';

import { createClient } from '@/utils/supabase/server';

export async function login(formData: FormData) {
  const supabase = createClient();

  // type-casting here for convenience
  // in practice, you should validate your inputs
  const data = {
    email: formData.get('email') as string,
    password: formData.get('password') as string
  };

  const { error } = await supabase.auth.signInWithPassword(data)

  if (error) {
    redirect('/error');
  }

  revalidatePath('/', 'layout');
  redirect('/');
}

export async function signup(formData: FormData) {
  const supabase = createClient();

  // type-casting here for convenience
  // in practice, you should validate your inputs
  const data = {
    email: formData.get('email') as string,
    password: formData.get('password') as string
  };

  const { error } = await supabase.auth.signUp(data);

  if (error) {
    redirect('/error');
  }

  revalidatePath('/', 'layout');
  redirect('/');
}
```

---

TITLE: Handling Supabase Auth Callback and Exchanging Code (Next.js)
DESCRIPTION: This Next.js API endpoint (`/api/auth/callback`) is designed to handle the redirect from Supabase after an authentication attempt. It creates an authenticated Supabase client, extracts the authentication code from the URL query string, and exchanges it for a user session, finally redirecting the user to a protected area of the application.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-04-13-supabase-auth-sso-pkce.mdx#_snippet_6

LANGUAGE: tsx
CODE:

```
// api/auth/callback
import { NextApiRequest, NextApiResponse } from 'next'
import { createServerSupabaseClient } from '@supabase/auth-helpers-nextjs'

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  // Create authenticated Supabase Client
  const supabase = createServerSupabaseClient(
    { req, res },
    {
      supabaseUrl: SUPABASE_URL,
      supabaseKey: SUPABASE_ANON_KEY,
    }
  )
  // check for code in url querystring
  const code = req.query.code

  if (typeof code === 'string') {
    // exchange the auth code for user session
    await supabase.auth.exchangeCodeForSession(code)
  }

  // redirect the user to a server-side protected area in your app
  res.redirect('/')
}
```

---

TITLE: Initializing Supabase Client with Third-Party Auth0 Access Token (TypeScript)
DESCRIPTION: This snippet demonstrates how to initialize the Supabase client to work with a third-party authentication provider like Auth0. It configures the `accessToken` option to asynchronously fetch an access token from Auth0, allowing Supabase to use it for authentication. This enables seamless integration of existing Auth0 users with Supabase services.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-08-14-third-party-auth-mfa-phone-send-hooks.mdx#_snippet_0

LANGUAGE: TypeScript
CODE:

```
import { createClient } from '@supabase/supabase-js'

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
  accessToken: async () => {
    const accessToken = await auth0.getTokenSilently()
    return accessToken
  },
})
```

---

TITLE: Defining Foreign Key with CASCADE Delete in SQL
DESCRIPTION: This SQL statement demonstrates how to create a foreign key constraint named fk_parent on child_table.parent_id referencing parent_table.id. The ON DELETE CASCADE clause ensures that when a row in parent_table is deleted, all related rows in child_table are automatically deleted as well.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/cascade-deletes.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
alter table child_table
add constraint fk_parent foreign key (parent_id) references parent_table (id)
  on delete cascade;
```

---

TITLE: Supabase createClient Utility Usage Across Next.js Routers
DESCRIPTION: A reference table detailing which `createClient` utility to import and use based on the Next.js router (App or Pages) and the specific code location (Server Component, Client Component, `getServerSideProps`, `getStaticProps`, Component, or API route).
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/server-side/nextjs.mdx#_snippet_20

LANGUAGE: APIDOC
CODE:

```
Router: App Router
  Code location: Server Component, Server Action, or Route Handler
    createClient: server.ts
  Code location: Client Component
    createClient: client.ts
Router: Pages Router
  Code location: getServerSideProps
    createClient: server-props.ts
  Code location: getStaticProps
    createClient: static-props.ts
  Code location: Component
    createClient: component.ts
  Code location: API route
    createClient: api.ts
```

---

TITLE: Configuring RLS Policy with JWT auth.uid() - SQL
DESCRIPTION: This SQL snippet enables Row Level Security (RLS) on the `document_sections` table and defines a policy for authenticated users. It uses the `auth.uid()` function, which automatically extracts the user ID from the JWT's `sub` claim, to filter document sections based on ownership, suitable for REST API interactions.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/rag-with-permissions.mdx#_snippet_12

LANGUAGE: SQL
CODE:

```
-- enable row level security
alter table document_sections enable row level security;

-- setup RLS for select operations
create policy "Users can query their own document sections"
on document_sections for select to authenticated using (
  document_id in (
    select id
    from documents
    where (owner_id = (select auth.uid()))
  )
);
```

---

TITLE: Configuring Supabase Environment Variables (.env)
DESCRIPTION: This snippet shows how to set up essential Supabase API keys and URL in the `.env` file. These variables (`SUPABASE_URL`, `SUPABASE_KEY`, `SUPABASE_JWT_SECRET`) are crucial for the `api side` of the RedwoodJS application to interact securely with the Supabase backend.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-redwoodjs.mdx#_snippet_2

LANGUAGE: bash
CODE:

```
SUPABASE_URL=YOUR_SUPABASE_URL
SUPABASE_KEY=YOUR_SUPABASE_ANON_KEY
SUPABASE_JWT_SECRET=YOUR_SUPABASE_JWT_SECRET
```

---

TITLE: Initializing Supabase Client with Firebase Auth Token (TypeScript)
DESCRIPTION: This snippet demonstrates how to initialize the Supabase client in TypeScript for web applications, using an asynchronous `accessToken` function. This function retrieves the current user's Firebase Auth JWT, which Supabase uses for authentication. It's crucial to ensure users have the 'role: authenticated' custom claim, potentially requiring a `forceRefresh` after sign-up if using `onCreate` Cloud Functions.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/third-party/firebase-auth.mdx#_snippet_0

LANGUAGE: TypeScript
CODE:

```
import { createClient } from '@supabase/supabase-js'

const supabase = createClient('https://<supabase-project>.supabase.co', 'SUPABASE_ANON_KEY', {
  accessToken: async () => {
    return (await firebase.auth().currentUser?.getIdToken(/* forceRefresh */ false)) ?? null
  },
})
```

---

TITLE: Configuring Supabase Environment Variables
DESCRIPTION: This snippet shows how to set up environment variables for Supabase project URL and anonymous key, typically in a `.env` file, which are essential for connecting to your Supabase project.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/remix.mdx#_snippet_1

LANGUAGE: Bash
CODE:

```
SUPABASE_URL=YOUR_SUPABASE_URL
SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
```

---

TITLE: Initializing Supabase Client and App in Flutter Main
DESCRIPTION: This Dart code initializes the Supabase client in the `main` function using `Supabase.initialize` with provided URL and anonymous key. It also defines `MyApp` and a `showSnackBar` extension for `BuildContext`, setting up the core application and utility for displaying messages.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-flutter.mdx#_snippet_5

LANGUAGE: dart
CODE:

```
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL',
    anonKey: 'YOUR_SUPABASE_ANON_KEY',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Supabase Flutter');
  }
}

extension ContextExtension on BuildContext {
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? Theme.of(this).colorScheme.error
            : Theme.of(this).snackBarTheme.backgroundColor,
      ),
    );
  }
}
```

---

TITLE: Installing Supabase JavaScript Client
DESCRIPTION: This command installs the official `@supabase/supabase-js` library, which is required to interact with Supabase services from a JavaScript/TypeScript application.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-11-17-fetching-and-caching-supabase-data-in-next-js-server-components.mdx#_snippet_3

LANGUAGE: bash
CODE:

```
npm install @supabase/supabase-js
```

---

TITLE: Implement Apple Sign-In with Expo and Supabase
DESCRIPTION: This TypeScript React Native component demonstrates how to integrate Apple Sign-In using `expo-apple-authentication` and `supabase-js`. It handles the authentication flow, including requesting user scopes, obtaining the identity token, and signing in with Supabase Auth. Error handling for user cancellation and other issues is also included.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/social-login/auth-apple.mdx#_snippet_5

LANGUAGE: tsx
CODE:

```
import { Platform } from 'react-native'
import * as AppleAuthentication from 'expo-apple-authentication'
import { supabase } from 'app/utils/supabase'

export function Auth() {
  if (Platform.OS === 'ios')
    return (
      <AppleAuthentication.AppleAuthenticationButton
        buttonType={AppleAuthentication.AppleAuthenticationButtonType.SIGN_IN}
        buttonStyle={AppleAuthentication.AppleAuthenticationButtonStyle.BLACK}
        cornerRadius={5}
        style={{ width: 200, height: 64 }}
        onPress={async () => {
          try {
            const credential = await AppleAuthentication.signInAsync({
              requestedScopes: [
                AppleAuthentication.AppleAuthenticationScope.FULL_NAME,
                AppleAuthentication.AppleAuthenticationScope.EMAIL,
              ],
            })
            // Sign in via Supabase Auth.
            if (credential.identityToken) {
              const {
                error,
                data: { user },
              } = await supabase.auth.signInWithIdToken({
                provider: 'apple',
                token: credential.identityToken,
              })
              console.log(JSON.stringify({ error, user }, null, 2))
              if (!error) {
                // User is signed in.
              }
            } else {
              throw new Error('No identityToken.')
            }
          } catch (e) {
            if (e.code === 'ERR_REQUEST_CANCELED') {
              // handle that the user canceled the sign-in flow
            } else {
              // handle other errors
            }
          }
        }}
      />
    )
  return <>{/* Implement Android Auth options. */}</>
}
```

---

TITLE: Chaining Supabase Realtime Postgres Change Listeners in TypeScript
DESCRIPTION: This code illustrates how to set up multiple Supabase Realtime subscriptions on a single channel to listen for changes in different database tables. It specifically listens for INSERT events on the 'participants' table to update the lobby list and UPDATE events on the 'games' table to synchronize the game state (current question sequence and screen phase) for the host. This is crucial for keeping all connected clients in sync with the game's progression.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-05-09-meetup-kahoot-alternative.mdx#_snippet_1

LANGUAGE: TypeScript
CODE:

```
supabase
  .channel('game')
  .on(
    'postgres_changes',
    {
      event: 'INSERT',
      schema: 'public',
      table: 'participants',
      filter: `game_id=eq.${gameId}`,
    },
    (payload) => {
      setParticipants((currentParticipants) => {
        return [...currentParticipants, payload.new as Participant]
      })
    }
  )
  .on(
    'postgres_changes',
    {
      event: 'UPDATE',
      schema: 'public',
      table: 'games',
      filter: `id=eq.${gameId}`,
    },
    (payload) => {
      const game = payload.new as Game
      setCurrentQuestionSequence(game.current_question_sequence)
      setCurrentScreen(game.phase as AdminScreens)
    }
  )
  .subscribe()
```

---

TITLE: Defining a Tool with JSON Schema for LLMs (JSON)
DESCRIPTION: This JSON schema illustrates how a tool, such as `get_weather`, is defined for Large Language Models (LLMs) to understand its capabilities and required parameters. It specifies the tool's name, a description of its function, and the structure of its input parameters, including their types and whether they are mandatory. This format is standard across most LLMs for tool calling.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2025-04-04-mcp-server.mdx#_snippet_1

LANGUAGE: json
CODE:

```
{
  "name": "get_weather",
  "description": "Get the current weather for a specific location",
  "parameters": {
    "type": "object",
    "properties": {
      "location": {
        "type": "string",
        "description": "The city and state/country, e.g. 'San Francisco, CA' or 'Paris, France'"
      }
    },
    "required": ["location"]
  }
}
```

---

TITLE: Policy Allowing Users to Access Their Own Records (SQL)
DESCRIPTION: This policy grants authenticated users access to records in `test_table` where the `user_id` matches their authenticated user ID (`auth.uid()`). It's presented as an example for which an index should be added for performance.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/prompts/database-rls-policies.md#_snippet_9

LANGUAGE: SQL
CODE:

```
create policy "Users can access their own records" on test_table
to authenticated
using ( (select auth.uid()) = user_id );
```

---

TITLE: Configuring Supabase Environment Variables in Next.js
DESCRIPTION: This snippet shows the essential environment variables required for connecting a Next.js application to Supabase. These variables, NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_ANON_KEY, are used by the Supabase client to initialize the connection. They must be populated with values from your Supabase project dashboard or local instance.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/ui-library/content/docs/nextjs/social-auth.mdx#_snippet_0

LANGUAGE: env
CODE:

```
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
```

---

TITLE: Supabase Edge Function for Sending FCM Push Notifications
DESCRIPTION: TypeScript code for the `push` Edge Function. This function is triggered by a database webhook on `notifications` table inserts, fetches the user's FCM token, obtains an FCM access token, and sends a push notification via the FCM API.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/functions/examples/push-notifications.mdx#_snippet_4

LANGUAGE: TypeScript
CODE:

```
import { createClient } from 'npm:@supabase/supabase-js@2'
import { JWT } from 'npm:google-auth-library@9'
import serviceAccount from '../service-account.json' with { type: 'json' }

interface Notification {
  id: string
  user_id: string
  body: string
}

interface WebhookPayload {
  type: 'INSERT'
  table: string
  record: Notification
  schema: 'public'
}

const supabase = createClient(
  Deno.env.get('SUPABASE_URL')!,
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
)

Deno.serve(async (req) => {
  const payload: WebhookPayload = await req.json()

  const { data } = await supabase
    .from('profiles')
    .select('fcm_token')
    .eq('id', payload.record.user_id)
    .single()

  const fcmToken = data!.fcm_token as string

  const accessToken = await getAccessToken({
    clientEmail: serviceAccount.client_email,
    privateKey: serviceAccount.private_key,
  })

  const res = await fetch(
    `https://fcm.googleapis.com/v1/projects/${serviceAccount.project_id}/messages:send`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${accessToken}`,
      },
      body: JSON.stringify({
        message: {
          token: fcmToken,
          notification: {
            title: `Notification from Supabase`,
            body: payload.record.body,
          },
        },
      }),
    }
  )

  const resData = await res.json()
  if (res.status < 200 || 299 < res.status) {
    throw resData
  }

  return new Response(JSON.stringify(resData), {
    headers: { 'Content-Type': 'application/json' },
  })
})

const getAccessToken = ({
  clientEmail,
  privateKey,
}: {
  clientEmail: string
  privateKey: string
}): Promise<string> => {
  return new Promise((resolve, reject) => {
    const jwtClient = new JWT({
      email: clientEmail,
      key: privateKey,
      scopes: ['https://www.googleapis.com/auth/firebase.messaging'],
    })
    jwtClient.authorize((err, tokens) => {
      if (err) {
        reject(err)
        return
      }
      resolve(tokens!.access_token!)
    })
  })
}
```

---

TITLE: Implementing Hybrid Search with Supabase Edge Function (JavaScript)
DESCRIPTION: An example of a Supabase Edge Function written in JavaScript (Deno runtime) that handles an incoming user query, generates an embedding using OpenAI, and then calls the `hybrid_search` PostgreSQL function via Supabase RPC. It requires environment variables for Supabase URL, service role key, and OpenAI API key.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/hybrid-search.mdx#_snippet_4

LANGUAGE: JavaScript
CODE:

```
import { createClient } from 'npm:@supabase/supabase-js@2'
import OpenAI from 'npm:openai'

const supabaseUrl = Deno.env.get('SUPABASE_URL')!
const supabaseServiceRoleKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
const openaiApiKey = Deno.env.get('OPENAI_API_KEY')!

Deno.serve(async (req) => {
  // Grab the user's query from the JSON payload
  const { query } = await req.json()

  // Instantiate OpenAI client
  const openai = new OpenAI({ apiKey: openaiApiKey })

  // Generate a one-time embedding for the user's query
  const embeddingResponse = await openai.embeddings.create({
    model: 'text-embedding-3-large',
    input: query,
    dimensions: 512,
  })

  const [{ embedding }] = embeddingResponse.data

  // Instantiate the Supabase client
  // (replace service role key with user's JWT if using Supabase auth and RLS)
  const supabase = createClient(supabaseUrl, supabaseServiceRoleKey)

  // Call hybrid_search Postgres function via RPC
  const { data: documents } = await supabase.rpc('hybrid_search', {
    query_text: query,
    query_embedding: embedding,
    match_count: 10,
  })

  return new Response(JSON.stringify(documents), {
    headers: { 'Content-Type': 'application/json' },
  })
})
```

---

TITLE: Creating a SELECT Policy for All Users (SQL)
DESCRIPTION: This policy grants `SELECT` access to the 'profiles' table for both authenticated and unauthenticated users (`anon`). The `using (true)` clause indicates that all rows are viewable without specific conditions.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/prompts/database-rls-policies.md#_snippet_1

LANGUAGE: SQL
CODE:

```
create policy "Profiles are viewable by everyone"
on profiles
for select
to authenticated, anon
using ( true );
```

---

TITLE: Enabling pgvector Extension in Postgres
DESCRIPTION: This SQL snippet enables the `pgvector` extension within the `extensions` schema in a PostgreSQL database. This is a prerequisite for storing and querying vector embeddings.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-02-13-matryoshka-embeddings.mdx#_snippet_10

LANGUAGE: SQL
CODE:

```
create extension vector
with
  schema extensions;
```

---

TITLE: Initializing Supabase Client in Svelte
DESCRIPTION: This TypeScript file (`src/supabaseClient.ts`) initializes and exports a Supabase client instance using the `createClient` function. It retrieves the Supabase URL and `anon` key from environment variables, establishing the connection for all Supabase interactions within the Svelte application.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-svelte.mdx#_snippet_4

LANGUAGE: typescript
CODE:

```
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

export const supabase = createClient(supabaseUrl, supabaseAnonKey)
```

---

TITLE: Implementing Authentication Component (React JSX)
DESCRIPTION: This React component (`src/Auth.jsx`) handles user authentication using Supabase Magic Links. It provides an email input field and a submit button, sending a magic link to the user's email for passwordless sign-in. It manages loading states and displays alerts for success or errors.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-react.mdx#_snippet_4

LANGUAGE: jsx
CODE:

```
import { useState } from 'react'
import { supabase } from './supabaseClient'

export default function Auth() {
  const [loading, setLoading] = useState(false)
  const [email, setEmail] = useState('')

  const handleLogin = async (event) => {
    event.preventDefault()

    setLoading(true)
    const { error } = await supabase.auth.signInWithOtp({ email })

    if (error) {
      alert(error.error_description || error.message)
    } else {
      alert('Check your email for the login link!')
    }
    setLoading(false)
  }

  return (
    <div className="row flex flex-center">
      <div className="col-6 form-widget">
        <h1 className="header">Supabase + React</h1>
        <p className="description">Sign in via magic link with your email below</p>
        <form className="form-widget" onSubmit={handleLogin}>
          <div>
            <input
              className="inputField"
              type="email"
              placeholder="Your email"
              value={email}
              required={true}
              onChange={(e) => setEmail(e.target.value)}
            />
          </div>
          <div>
            <button className={'button block'} disabled={loading}>
              {loading ? <span>Loading</span> : <span>Send magic link</span>}
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}
```

---

TITLE: Handling Supabase Authentication State in React Native App
DESCRIPTION: This TypeScript React Native component (`App.tsx`) serves as the main entry point, managing the user's authentication session with Supabase. It uses `useEffect` to listen for session changes and conditionally renders either the `Account` component (if a user is signed in) or the `Auth` component (for sign-in/sign-up). This ensures the correct UI is displayed based on the authentication state.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-expo-react-native.mdx#_snippet_6

LANGUAGE: tsx
CODE:

```
import { useState, useEffect } from 'react'
import { supabase } from './lib/supabase'
import Auth from './components/Auth'
import Account from './components/Account'
import { View } from 'react-native'
import { Session } from '@supabase/supabase-js'

export default function App() {
  const [session, setSession] = useState<Session | null>(null)

  useEffect(() => {
    supabase.auth.getSession().then(({ data: { session } }) => {
      setSession(session)
    })

    supabase.auth.onAuthStateChange((_event, session) => {
      setSession(session)
    })
  }, [])

  return (
    <View>
      {session && session.user ? <Account key={session.user.id} session={session} /> : <Auth />}
    </View>
  )
}
```

---

TITLE: Querying Supabase Data in SwiftUI ContentView
DESCRIPTION: This SwiftUI `ContentView` fetches instrument data from the Supabase 'instruments' table using an asynchronous `task` modifier. It displays the data in a `List` and shows a `ProgressView` while data is loading. Errors during fetching are caught and dumped.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/quickstarts/ios-swiftui.mdx#_snippet_2

LANGUAGE: Swift
CODE:

```
struct ContentView: View {

  @State var instruments: [Instrument] = []

  var body: some View {
    List(instruments) { instrument in
      Text(instrument.name)
    }
    .overlay {
      if instruments.isEmpty {
        ProgressView()
      }
    }
    .task {
      do {
        instruments = try await supabase.from("instruments").select().execute().value
      } catch {
        dump(error)
      }
    }
  }
}
```

---

TITLE: Configuring PKCE Auth Flow Redirect - JavaScript
DESCRIPTION: This snippet shows how to configure the `emailRedirectTo` option for Supabase authentication methods like `signUp` when migrating to the PKCE auth flow (v0.7.X). The `emailRedirectTo` must point to the new `/api/auth/callback` route for proper code exchange.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs-pages.mdx#_snippet_19

LANGUAGE: jsx
CODE:

```
supabase.auth.signUp({
  email: 'valid.email@supabase.io',
  password: 'sup3rs3cur3',
  options: {
    emailRedirectTo: 'http://localhost:3000/auth/callback',
  },
})
```

---

TITLE: Initializing Supabase Client in Vue 3 (JavaScript)
DESCRIPTION: This JavaScript snippet creates and exports a Supabase client instance in `src/supabase.js`. It imports `createClient` from `@supabase/supabase-js` and uses environment variables (`VITE_SUPABASE_URL`, `VITE_SUPABASE_ANON_KEY`) to configure the client. This client instance will be used throughout the application to interact with Supabase services.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-vue-3.mdx#_snippet_3

LANGUAGE: javascript
CODE:

```
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

export const supabase = createClient(supabaseUrl, supabaseAnonKey)
```

---

TITLE: Configuring Legend-State for Supabase and Local Persistence
DESCRIPTION: This TypeScript snippet configures Legend-State's sync and persistence mechanisms. It integrates syncedSupabase for remote synchronization with Supabase and observablePersistAsyncStorage for local data persistence using React Native Async Storage, enabling local-first capabilities and offline support.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-09-23-local-first-expo-legend-state.mdx#_snippet_4

LANGUAGE: typescript
CODE:

```
import { createClient } from '@supabase/supabase-js'
import { observable } from '@legendapp/state'
import { syncedSupabase } from '@legendapp/state/sync-plugins/supabase'
import { configureSynced } from '@legendapp/state/sync'
import { observablePersistAsyncStorage } from '@legendapp/state/persist-plugins/async-storage'
import AsyncStorage from '@react-native-async-storage/async-storage'

const supabase = createClient(
  process.env.EXPO_PUBLIC_SUPABASE_URL,
  process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY
)

// Create a configured sync function
const customSynced = configureSynced(syncedSupabase, {
  // Use React Native Async Storage
  persist: {
    plugin: observablePersistAsyncStorage({
      AsyncStorage,
    }),
  },
  generateId,
  supabase,
  changesSince: 'last-sync',
  fieldCreatedAt: 'created_at',
  fieldUpdatedAt: 'updated_at',
  // Optionally enable soft deletes
  fieldDeleted: 'deleted',
})

export const todos$ = observable(
  customSynced({
    supabase,
    collection: 'todos',
    select: (from) => from.select('id,counter,text,done,created_at,updated_at,deleted'),
    actions: ['read', 'create', 'update', 'delete'],
    realtime: true,
    // Persist data and pending changes locally
    persist: {
      name: 'todos',
      retrySync: true, // Persist pending changes and retry
    },
    retry: {
      infinite: true, // Retry changes with exponential backoff
    },
  })
)
```

---

TITLE: Adding IVFFlat Index for Cosine Similarity in PostgreSQL
DESCRIPTION: This SQL snippet creates an `ivfflat` index on the `embedding` column of the `documents` table, specifically optimized for cosine distance operations (`vector_cosine_ops`). This index significantly speeds up similarity search queries, especially as the number of embeddings grows. The `lists` parameter configures the number of inverted lists for the index, impacting performance and accuracy.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-02-03-openai-embeddings-postgres-vector.mdx#_snippet_3

LANGUAGE: SQL
CODE:

```
create index on documents using ivfflat (embedding vector_cosine_ops)
with
  (lists = 100);
```

---

TITLE: Implementing Supabase Authentication in Next.js Client Component (TypeScript)
DESCRIPTION: This client-side React component, written in TypeScript, demonstrates user authentication flows (sign up, sign in, sign out) using Supabase. It utilizes `createClientComponentClient` with database types for enhanced type safety and `next/navigation` to refresh the router after authentication actions. It requires user email and password inputs.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs.mdx#_snippet_7

LANGUAGE: tsx
CODE:

```
'use client'

import { createClientComponentClient } from '@supabase/auth-helpers-nextjs'
import { useRouter } from 'next/navigation'
import { useState } from 'react'

import type { Database } from '@/lib/database.types'

export default function Login() {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const router = useRouter()
  const supabase = createClientComponentClient<Database>()

  const handleSignUp = async () => {
    await supabase.auth.signUp({
      email,
      password,
      options: {
        emailRedirectTo: `${location.origin}/auth/callback`,
      },
    })
    router.refresh()
  }

  const handleSignIn = async () => {
    await supabase.auth.signInWithPassword({
      email,
      password,
    })
    router.refresh()
  }

  const handleSignOut = async () => {
    await supabase.auth.signOut()
    router.refresh()
  }

  return (
    <>
      <input name="email" onChange={(e) => setEmail(e.target.value)} value={email} />
      <input
        type="password"
        name="password"
        onChange={(e) => setPassword(e.target.value)}
        value={password}
      />
      <button onClick={handleSignUp}>Sign up</button>
      <button onClick={handleSignIn}>Sign in</button>
      <button onClick={handleSignOut}>Sign out</button>
    </>
  )
}
```

---

TITLE: Handling Realtime List Updates in Angular Component
DESCRIPTION: This TypeScript code block extends the real-time update handling to process changes for the 'lists' table. It applies similar logic as the 'cards' handling: for 'INSERT', it adds the new list and initializes an empty card array for it; for 'UPDATE', it finds and replaces the updated list; and for 'DELETE', it removes the list from the local `lists` array. This ensures the UI reflects the latest state of the 'lists' table.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-08-24-building-a-realtime-trello-board-with-supabase-and-angular.mdx#_snippet_30

LANGUAGE: TypeScript
CODE:

```
else if (update.table == 'lists') {
  if (event === 'INSERT') {
    this.lists.push(record);
    this.listCards[record.id] = [];
  } else if (event === 'UPDATE') {
    this.lists.filter((list: any) => list.id === record.id)[0] = record;

    const newArr = [];

    for (let list of this.lists) {
      if (list.id == record.id) {
        list = record;
      }
      newArr.push(list);
    }
    this.lists = newArr;
  } else if (event === 'DELETE') {
    this.lists = this.lists.filter((list: any) => list.id !== record.id);
  }
}
```

---

TITLE: Optimizing Log Queries by Selecting Specific Fields in BigQuery SQL
DESCRIPTION: This snippet illustrates a best practice for querying logs: avoiding the selection of entire large nested objects. The first example (❌) shows an inefficient query that selects the full `metadata` object, while the second example (✅) demonstrates how to optimize by selecting only the required specific fields like `r.method`, improving query speed and preventing timeouts.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/telemetry/logs.mdx#_snippet_10

LANGUAGE: SQL
CODE:

```
-- ❌ Avoid doing this
select
  datetime(timestamp),
  m as metadata -- <- metadata contains many nested keys
from
  edge_logs as t
  cross join unnest(t.metadata) as m;
```

LANGUAGE: SQL
CODE:

```
-- ✅ Do this
select
  datetime(timestamp),
  r.method -- <- select only the required values
from
  edge_logs as t
  cross join unnest(t.metadata) as m
  cross join unnest(m.request) as r;
```

---

TITLE: Configuring Supabase Environment Variables for React
DESCRIPTION: This snippet shows the required environment variables for connecting a React project to Supabase. These variables, VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY, should be placed in a .env file at the project root. They are essential for the Supabase client to initialize and communicate with your Supabase project.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/ui-library/content/docs/react/client.mdx#_snippet_0

LANGUAGE: dotenv
CODE:

```
VITE_SUPABASE_URL=
VITE_SUPABASE_ANON_KEY=
```

---

TITLE: Deploying Supabase Edge Functions via CLI API - Bash
DESCRIPTION: This command deploys a Supabase Edge Function using the new `--use-api` flag, which bypasses the need for Docker. This streamlines the deployment process directly through Supabase's new public APIs, making it faster and more accessible for custom integrations.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2025-04-01-supabase-edge-functions-deploy-dashboard-deno-2-1.mdx#_snippet_0

LANGUAGE: bash
CODE:

```
supabase functions deploy MY_FUNCTION --use-api
```

---

TITLE: Create SQL Function and Trigger for New User Profile Creation
DESCRIPTION: This SQL snippet defines a PostgreSQL function `public.handle_new_user` that inserts a new row into the `public.profiles` table whenever a new user is created in `auth.users`. It also sets up a trigger `on_auth_user_created` to automatically execute this function after each user insertion, populating the profile with metadata from `raw_user_meta_data`.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/managing-user-data.mdx#_snippet_1

LANGUAGE: SQL
CODE:

```
-- inserts a row into public.profiles
create function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = ''
as $$
begin
  insert into public.profiles (id, first_name, last_name)
  values (new.id, new.raw_user_meta_data ->> 'first_name', new.raw_user_meta_data ->> 'last_name');
  return new;
end;
$$;

-- trigger the function every time a user is created
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();
```

---

TITLE: Handling Supabase User Sign-up in Next.js Server Route (JavaScript)
DESCRIPTION: This Next.js Route Handler (POST) processes user sign-up requests. It extracts email and password from form data, uses `createRouteHandlerClient` with `next/headers` cookies to interact with Supabase Auth, and redirects the user after successful sign-up. A 301 status is used for redirection from POST to GET.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs.mdx#_snippet_8

LANGUAGE: jsx
CODE:

```
import { createRouteHandlerClient } from '@supabase/auth-helpers-nextjs'
import { cookies } from 'next/headers'
import { NextResponse } from 'next/server'

export async function POST(request) {
  const requestUrl = new URL(request.url)
  const formData = await request.formData()
  const email = formData.get('email')
  const password = formData.get('password')
  const cookieStore = cookies()
  const supabase = createRouteHandlerClient({ cookies: () => cookieStore })

  await supabase.auth.signUp({
    email,
    password,
    options: {
      emailRedirectTo: `${requestUrl.origin}/auth/callback`,
    },
  })

  return NextResponse.redirect(requestUrl.origin, {
    status: 301,
  })
}
```

---

TITLE: Generating TypeScript Types for Supabase Schemas
DESCRIPTION: This command uses the Supabase CLI to generate TypeScript types for specified database schemas (storage and public). The output is redirected to a `types.ts` file, which is crucial for type-safe interactions with the Supabase database and storage within Edge Functions. It requires a valid Supabase project ID.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/edge-functions/supabase/functions/huggingface-image-captioning/README.md#_snippet_0

LANGUAGE: bash
CODE:

```
supabase gen types typescript --project-id=your-project-ref --schema=storage,public > supabase/functions/huggingface-image-captioning/types.ts
```

---

TITLE: Terminating a Postgres Connection (SQL)
DESCRIPTION: This SQL query allows for the termination of a specific PostgreSQL backend process (connection) identified by its Process ID (PID). It is used to kill connections that are hogging resources or are no longer needed, helping to free up connection slots and improve database performance. The `<connection_id>` placeholder must be replaced with the actual PID of the connection to be terminated.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/monitor-supavisor-postgres-connections.mdx#_snippet_1

LANGUAGE: SQL
CODE:

```
  select pg_terminate_backend(pid)
  from pg_stat_activity
  where pid = <connection_id>;
```

---

TITLE: Creating a Complex Query Stored Function in PostgreSQL
DESCRIPTION: This SQL snippet defines a `plpgsql` stored function named `get_my_complex_query`. It encapsulates a complex multi-table join query, accepting an integer `parameter` and returning a table with specified columns. This function centralizes complex logic, making it reusable and more efficient.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/certain-operations-are-too-complex-to-perform-directly-using-the-client-libraries-8JaphH.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
DROP FUNCTION IF EXISTS get_my_complex_query;
CREATE FUNCTION get_my_complex_query(parameter INT)
RETURNS TABLE (column1 INTEGER, column2 VARCHAR, column3 DATE) AS
$$
BEGIN
    RETURN QUERY
    SELECT t1.column1, t1.column2, t2.column3
    FROM "TableName1" AS t1
    INNER JOIN "TableName2" AS t2 ON t1.column = t2.column
    INNER JOIN "TableName3" AS t3 ON t2.another_column = t3.another_column
    LEFT JOIN "TableName4" AS t4 ON t3.some_column = t4.some_column
    WHERE t2.column = parameter
    AND t3.column_name = 'some_value';
END;
$$
LANGUAGE plpgsql VOLATILE;
```

---

TITLE: Defining Row Level Security Policies in Supabase SQL
DESCRIPTION: This SQL block enables Row Level Security (RLS) for the `users`, `groups`, and `messages` tables, and then defines specific access policies. It allows all users to read user emails and group data, while restricting group creation, message reading, and message creation to authenticated users only. Group owners are also granted permission to delete their own groups, enhancing data security and access control.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-11-08-authentication-in-ionic-angular.mdx#_snippet_1

LANGUAGE: SQL
CODE:

```
-- Secure tables
alter table users enable row level security;
alter table groups enable row level security;
alter table messages enable row level security;

-- User Policies
create policy "Users can read the user email." on users
  for select using (true);

-- Group Policies
create policy "Groups are viewable by everyone." on groups
  for select using (true);

create policy "Authenticated users can create groups." on groups for
  insert to authenticated with check (true);

create policy "The owner can delete a group." on groups for
    delete using ((select auth.uid()) = creator);

-- Message Policies
create policy "Authenticated users can read messages." on messages
  for select to authenticated using (true);

create policy "Authenticated users can create messages." on messages
  for insert to authenticated with check (true);
```

---

TITLE: Configuring Supabase Auth Middleware in Next.js (TypeScript)
DESCRIPTION: This TypeScript middleware refreshes the user's Supabase session before Server Component routes are rendered. It creates a typed Supabase client configured to use cookies and ensures the session remains active by calling `supabase.auth.getSession()`. The `matcher` configuration limits its execution to relevant paths, and `Database` type provides type safety.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs.mdx#_snippet_3

LANGUAGE: ts
CODE:

```
import { createMiddlewareClient } from '@supabase/auth-helpers-nextjs'
import { NextResponse } from 'next/server'

import type { NextRequest } from 'next/server'
import type { Database } from '@/lib/database.types'

export async function middleware(req: NextRequest) {
  const res = NextResponse.next()

  // Create a Supabase client configured to use cookies
  const supabase = createMiddlewareClient<Database>({ req, res })

  // Refresh session if expired - required for Server Components
  await supabase.auth.getSession()

  return res
}

// Ensure the middleware is only called for relevant paths.
export const config = {
  matcher: [
    /*
     * Match all request paths except for the ones starting with:
     * - _next/static (static files)
     * - _next/image (image optimization files)
     * - favicon.ico (favicon file)
     */
    '/((?!_next/static|_next/image|favicon.ico).*)'
  ]
}
```

---

TITLE: Initializing Supabase Project (Bash)
DESCRIPTION: Initializes a new local Supabase project, creating the necessary directory structure and configuration files. This is the first step to set up a local development environment for Supabase.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/inspecting-edge-function-environment-variables-wg5qOQ.mdx#_snippet_0

LANGUAGE: bash
CODE:

```
npx supabase init
```

---

TITLE: Creating Real Index for Performance Improvement - SQL
DESCRIPTION: After confirming the utility of a hypothetical index, this snippet shows the standard SQL command to create a permanent, real index on the 'account(id)' column. This action materializes the performance improvement identified through the hypothetical index analysis.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/extensions/hypopg.mdx#_snippet_4

LANGUAGE: SQL
CODE:

```
create index on account(id);
```

---

TITLE: Initializing Supabase Project (Shell)
DESCRIPTION: Initializes a new Supabase project in the current directory. This command sets up the necessary configuration files and directories for a Supabase project, preparing it for local development and deployment.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/hugging-face.mdx#_snippet_0

LANGUAGE: shell
CODE:

```
supabase init
```

---

TITLE: Optimized RLS Policy Avoiding Joins in SQL
DESCRIPTION: This SQL snippet presents an optimized RLS policy for 'test_table' that avoids the explicit join seen in the previous example. Instead of joining, it selects 'team_id' values from 'team_user' where 'user_id' matches the authenticated user's ID. The policy then checks if the 'test_table.team_id' is present in this set, significantly improving performance by eliminating the join operation within the policy.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/row-level-security.mdx#_snippet_22

LANGUAGE: SQL
CODE:

```
create policy "rls_test_select" on test_table
to authenticated
using (
  team_id in (
    select team_id
    from team_user
    where user_id = (select auth.uid()) -- no join
  )
);
```

---

TITLE: Creating Browser Supabase Client for Client Components
DESCRIPTION: Implements a singleton pattern for creating and reusing a browser-side Supabase client using `@supabase/ssr`'s `createBrowserClient`. The `useSupabaseBrowser` hook memoizes this client, making it suitable for use in React client components to interact with Supabase, leveraging environment variables for configuration.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-01-12-react-query-nextjs-app-router-cache-helpers.mdx#_snippet_6

LANGUAGE: typescript
CODE:

```
import { createBrowserClient } from '@supabase/ssr'
import type { Database } from '@/utils/database.types'
import type { TypedSupabaseClient } from '@/utils/types'
import { useMemo } from 'react'

let client: TypedSupabaseClient | undefined

function getSupabaseBrowserClient() {
  if (client) {
    return client
  }

  client = createBrowserClient<Database>(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
  )

  return client
}

function useSupabaseBrowser() {
  return useMemo(getSupabaseBrowserClient, [])
}

export default useSupabaseBrowser
```

---

TITLE: Supabase: Basic Google Sign-in with OAuth (JavaScript)
DESCRIPTION: This snippet demonstrates the basic usage of `signInWithOAuth` to initiate a Google sign-in flow. It redirects the user to Google's consent screen and then back to the application with session tokens.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/social-login/auth-google.mdx#_snippet_2

LANGUAGE: js
CODE:

```
import { createClient } from '@supabase/supabase-js'
const supabase = createClient('url', 'anonKey')

// ---cut---
supabase.auth.signInWithOAuth({
  provider: 'google',
})
```

---

TITLE: Enabling Realtime Updates for Messages in Supabase SQL
DESCRIPTION: This SQL transaction configures Supabase's realtime functionality. It first drops any existing `supabase_realtime` publication, then recreates it to publish only `INSERT` events. Finally, it adds the `messages` table to this publication. This setup ensures that clients subscribed to the `messages` table will receive instant updates whenever new messages are inserted, facilitating a real-time chat experience.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-11-08-authentication-in-ionic-angular.mdx#_snippet_3

LANGUAGE: SQL
CODE:

```
begin;
  -- remove the supabase_realtime publication
  drop publication if exists supabase_realtime;

  -- re-create the supabase_realtime publication with no tables and only for insert
  create publication supabase_realtime with (publish = 'insert');
commit;

-- add a table to the publication
alter publication supabase_realtime add table messages;
```

---

TITLE: Broadcasting Custom Events with Supabase Realtime (JavaScript)
DESCRIPTION: This snippet demonstrates how to use Supabase Realtime's Broadcast feature to send and receive real-time custom events, specifically mouse cursor positions, within a designated channel. It subscribes to broadcast events filtered by a specific event type (`MOUSE_EVENT`) and provides a helper function to send custom payloads. This bypasses the database for ephemeral data.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-08-18-supabase-realtime-multiplayer-general-availability.mdx#_snippet_0

LANGUAGE: javascript
CODE:

```
const channel = supabase.channel('room_1')
const MOUSE_EVENT = 'cursor'

// Subscribe to mouse events.
// Our second parameter filters only for mouse events.
channel
  .on('broadcast', { event: MOUSE_EVENT }, (event) => {
    receivedCursorPosition(event)
  })
  .subscribe()

// Handle a mouse event.
const receivedCursorPosition = ({ event, payload }) => {
  console.log(`
		User: ${payload.userId}
		x Position: ${payload.x}
		y Position: ${payload.y}
	`)
}

// Helper function for sending our own mouse position.
const sendMousePosition = (channel, userId, x, y) => {
  return channel.send({
    type: 'broadcast',
    event: MOUSE_EVENT,
    payload: { userId, x, y },
  })
}
```

---

TITLE: Creating Avatar Upload Widget with Supabase Storage (TypeScript)
DESCRIPTION: This component provides functionality for uploading and displaying user avatars. It uses Supabase Storage to handle file uploads and downloads, generating a unique file path for each upload. The component manages upload state and provides a callback for successful uploads.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-refine.mdx#_snippet_12

LANGUAGE: TypeScript
CODE:

```
import { useEffect, useState } from 'react'
import { supabaseClient } from '../utility/supabaseClient'

type TAvatarProps = {
  url?: string
  size: number
  onUpload: (filePath: string) => void
}

export default function Avatar({ url, size, onUpload }: TAvatarProps) {
  const [avatarUrl, setAvatarUrl] = useState('')
  const [uploading, setUploading] = useState(false)

  useEffect(() => {
    if (url) downloadImage(url)
  }, [url])

  async function downloadImage(path: string) {
    try {
      const { data, error } = await supabaseClient.storage.from('avatars').download(path)
      if (error) {
        throw error
      }
      const url = URL.createObjectURL(data)
      setAvatarUrl(url)
    } catch (error: any) {
      console.log('Error downloading image: ', error?.message)
    }
  }

  async function uploadAvatar(event: React.ChangeEvent<HTMLInputElement>) {
    try {
      setUploading(true)

      if (!event.target.files || event.target.files.length === 0) {
        throw new Error('You must select an image to upload.')
      }

      const file = event.target.files[0]
      const fileExt = file.name.split('.').pop()
      const fileName = `${Math.random()}.${fileExt}`
      const filePath = `${fileName}`

      const { error: uploadError } = await supabaseClient.storage
        .from('avatars')
        .upload(filePath, file)

      if (uploadError) {
        throw uploadError
      }
      onUpload(filePath)
    } catch (error: any) {
      alert(error.message)
    } finally {
      setUploading(false)
    }
  }

  return (
    <div>
      {avatarUrl ? (
        <img
          src={avatarUrl}
          alt="Avatar"
          className="avatar image"
          style={{ height: size, width: size }}
        />
      ) : (
        <div className="avatar no-image" style={{ height: size, width: size }} />
      )}
      <div style={{ width: size }}>
        <label className="button primary block" htmlFor="single">
          {uploading ? 'Uploading ...' : 'Upload'}
        </label>
        <input
          style={{
            visibility: 'hidden',
            position: 'absolute',
          }}
          type="file"
          id="single"
          name="avatar_url"
          accept="image/*"
          onChange={uploadAvatar}
          disabled={uploading}
        />
      </div>
    </div>
  )
}
```

---

TITLE: Creating Supabase Auth User with Custom Metadata (TypeScript)
DESCRIPTION: This snippet demonstrates how to create a new user in Supabase Auth using the `admin.createUser` method. It shows how to include `user_metadata` for user-updatable information (like full name) and `app_metadata` for admin-controlled data (like roles), which are stored in `auth.users.raw_user_meta_data` and `auth.users.raw_app_meta_data` respectively. The `email` parameter is required for user creation.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/platform/migrating-to-supabase/auth0.mdx#_snippet_3

LANGUAGE: typescript
CODE:

```
import { createClient } from '@supabase/supabase-js'
const supabase = createClient('your_project_url', 'your_supabase_api_key')

// ---cut---
const { data, error } = await supabase.auth.admin.createUser({
  email: 'valid.email@supabase.io',
  user_metadata: {
    full_name: 'Foo Bar',
  },
  app_metadata: {
    role: 'admin',
  },
})
```

---

TITLE: Supabase Edge Function: Hugging Face Image Captioning
DESCRIPTION: This Deno-based Supabase Edge Function automatically captions images uploaded to Supabase Storage. It uses the Hugging Face Inference API's `imageToText` model to generate a description, which is then stored in a dedicated `image_caption` table in your Supabase database.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/examples/huggingface-image-captioning.mdx#_snippet_1

LANGUAGE: typescript
CODE:

```
import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'
import { HfInference } from 'https://esm.sh/@huggingface/inference@2.3.2'
import { createClient } from 'npm:@supabase/supabase-js@2'
import { Database } from './types.ts'

console.log('Hello from `huggingface-image-captioning` function!')

const hf = new HfInference(Deno.env.get('HUGGINGFACE_ACCESS_TOKEN'))

type SoRecord = Database['storage']['Tables']['objects']['Row']
interface WebhookPayload {
  type: 'INSERT' | 'UPDATE' | 'DELETE'
  table: string
  record: SoRecord
  schema: 'public'
  old_record: null | SoRecord
}

serve(async (req) => {
  const payload: WebhookPayload = await req.json()
  const soRecord = payload.record
  const supabaseAdminClient = createClient<Database>(
    // Supabase API URL - env var exported by default when deployed.
    Deno.env.get('SUPABASE_URL') ?? '',
    // Supabase API SERVICE ROLE KEY - env var exported by default when deployed.
    Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
  )

  // Construct image url from storage
  const { data, error } = await supabaseAdminClient.storage
    .from(soRecord.bucket_id!)
    .createSignedUrl(soRecord.path_tokens!.join('/'), 60)
  if (error) throw error
  const { signedUrl } = data

  // Run image captioning with Huggingface
  const imgDesc = await hf.imageToText({
    data: await (await fetch(signedUrl)).blob(),
    model: 'nlpconnect/vit-gpt2-image-captioning',
  })

  // Store image caption in Database table
  await supabaseAdminClient
    .from('image_caption')
    .insert({ id: soRecord.id!, caption: imgDesc.generated_text })
    .throwOnError()

  return new Response('ok')
})
```

---

TITLE: Explaining a Query Plan (SQL)
DESCRIPTION: This command is used to display the execution plan for a given SQL query. It helps developers understand how Postgres will execute the query, including which indexes are used, join methods, and scan types, which is crucial for performance tuning and debugging.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/how-postgres-chooses-which-index-to-use-_JHrf4.mdx#_snippet_3

LANGUAGE: SQL
CODE:

```
EXPLAIN <your query>
```

---

TITLE: Querying Document Embedding in Postgres
DESCRIPTION: This SQL query retrieves the id and embedding for a document by its title. Initially, the embedding column might be null due to the asynchronous nature of the embedding generation process, but it will be populated after the background job completes.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2025-04-01-automatic-embeddings.mdx#_snippet_6

LANGUAGE: SQL
CODE:

```
select id, embedding
from documents
where title = 'Understanding Vector Databases';
```

---

TITLE: Running Development Server with Angular CLI
DESCRIPTION: This command starts a development server for an Angular application. It automatically reloads the application in the browser when source files are changed, facilitating rapid development.
SOURCE: https://github.com/supabase/supabase/blob/master/examples/user-management/angular-user-management/README.md#_snippet_0

LANGUAGE: Shell
CODE:

```
ng serve
```

---

TITLE: Creating a Security Invoker View in PostgreSQL
DESCRIPTION: This SQL snippet demonstrates how to create a new view with the `security_invoker` modifier explicitly set. This ensures that any queries executed against this view will respect the permissions and row-level security policies of the user who is invoking the view, rather than the view's creator.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/tables.mdx#_snippet_20

LANGUAGE: SQL
CODE:

```
-- create a view with the security_invoker modifier
create view <view name> with(security_invoker=true) as (
  select * from <some table>
);
```

---

TITLE: Creating Notes Table with RLS (SQL)
DESCRIPTION: This SQL snippet provides the DDL (Data Definition Language) to create a `notes` table in a PostgreSQL database, typically used with Supabase. It includes setting up Row Level Security (RLS) policies to restrict access, ensuring that authenticated users can only access and modify their own notes.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/server-side/sveltekit.mdx#_snippet_15

LANGUAGE: SQL
CODE:

```
-- Run this SQL against your database to create a `notes` table.

create table notes (
  id bigint primary key generated always as identity,
  created_at timestamp with time zone not null default now(),
  user_id uuid references auth.users on delete cascade not null default auth.uid(),
  note text not null
);

alter table notes enable row level security;

revoke all on table notes from authenticated;
revoke all on table notes from anon;

grant all (note) on table notes to authenticated;
grant select (id) on table notes to authenticated;
grant delete on table notes to authenticated;

create policy "Users can access and modify their own notes"
on notes
for all
to authenticated
using ((select auth.uid()) = user_id);
```

---

TITLE: RLS Policy with `TO authenticated` Role Specification in SQL
DESCRIPTION: This SQL snippet defines an RLS policy on 'rls_test' that explicitly specifies `TO authenticated`. This ensures the policy is only evaluated for authenticated users, preventing unnecessary execution for unauthenticated ('anon') users. This optimization improves performance by stopping policy evaluation early for irrelevant roles.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/row-level-security.mdx#_snippet_24

LANGUAGE: SQL
CODE:

```
create policy "rls_test_select" on rls_test
to authenticated
using ( (select auth.uid()) = user_id );
```

---

TITLE: Implementing User Registration with Supabase in Flutter
DESCRIPTION: This Flutter widget defines the user registration page, allowing users to sign up with their email and password. It utilizes `supabase.auth.signUp()` to create a new account and includes an `emailRedirectTo` option to guide users to the MFA enrollment page after email confirmation. Error handling for authentication exceptions is also included.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-05-04-flutter-multi-factor-authentication.mdx#_snippet_7

LANGUAGE: Dart
CODE:

```
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mfa_app/main.dart';
import 'package:mfa_app/pages/auth/login_page.dart';
import 'package:mfa_app/pages/mfa/enroll_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterPage extends StatefulWidget {
  static const route = '/auth/register';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              label: Text('Email'),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              label: Text('Password'),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              try {
                setState(() {
                  _isLoading = true;
                });
                final email = _emailController.text.trim();
                final password = _passwordController.text.trim();
                await supabase.auth.signUp(
                  email: email,
                  password: password,
                  emailRedirectTo:
                      'mfa-app://callback${MFAEnrollPage.route}', // redirect the user to setup MFA page after email confirmation
                );
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Check your inbox.')));
                }
              } on AuthException catch (error) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(error.message)));
              } catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Unexpected error occurred')));
              }
              if (mounted) {
                setState(() {
                  _isLoading = false;
                });
              }
            },
            child: _isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: Center(
                        child: CircularProgressIndicator(color: Colors.white)),
                  )
                : const Text('Register'),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => context.push(LoginPage.route),
            child: const Text('I already have an account'),
          )
        ],
      ),
    );
  }
}
```

---

TITLE: Creating a PL/pgSQL Function for Database Change Broadcasts - SQL
DESCRIPTION: This PL/pgSQL function, `your_table_changes()`, is designed to be executed by a database trigger. It uses `realtime.broadcast_changes` to send a message to a specific Realtime topic whenever a change (INSERT, UPDATE, DELETE) occurs in a monitored table. The function passes details like the topic, operation type, table name, and both new and old record data.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2025-04-02-realtime-broadcast-from-database.mdx#_snippet_1

LANGUAGE: SQL
CODE:

```
create or replace function public.your_table_changes()
returns trigger
security definer
language plpgsql
as $$
begin
    perform realtime.broadcast_changes(
	    'topic:' || new.id::text,   -- topic
		   tg_op,                          -- event
		   tg_op,                          -- operation
		   tg_table_name,                  -- table
		   tg_table_schema,                -- schema
		   new,                            -- new record
		   old                             -- old record
		);
    return null;
end;
$$;
```

---

TITLE: Enabling `explain()` for Postgres Query Planning (SQL)
DESCRIPTION: This SQL snippet enables the `EXPLAIN` plan feature for the `authenticator` role in a Supabase database. It sets the `pgrst.db_plan_enabled` configuration to `true` and then reloads the PostgREST configuration to apply the changes. This allows users authenticated via the `authenticator` role to use the `explain()` method for query analysis.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/debugging-performance.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
-- enable explain
alter role authenticator
set pgrst.db_plan_enabled to 'true';

-- reload the config
notify pgrst, 'reload config';
```

---

TITLE: Updating Cloudflare Worker Revalidate Route with waitUntil (JavaScript)
DESCRIPTION: This JavaScript snippet defines a POST route `/revalidate` that uses `context.waitUntil` to perform cache updates asynchronously after sending an immediate JSON response. It interacts with Supabase to fetch articles and updates a Cloudflare KV store (`ARTICLES`) based on the type of database change (INSERT, UPDATE, DELETE).
SOURCE: https://github.com/supabase/supabase/blob/master/examples/caching/with-cloudflare-workers-kv/README.md#_snippet_0

LANGUAGE: JavaScript
CODE:

```
router.post(
  "/revalidate",
  withContent,
  async (request, { SUPABASE_URL, SUPABASE_ANON_KEY, ARTICLES }, context) => {
    const updateCache = async () => {
      const { type, record, old_record } = request.content;
      const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

      if (type === "INSERT" || type === "UPDATE") {
        await writeTo(ARTICLES, `/articles/${record.id}`, record);
      }

      if (type === "DELETE") {
        await ARTICLES.delete(`/articles/${old_record.id}`);
      }

      const { data: articles } = await supabase.from("articles").select("*");
      await writeTo(ARTICLES, "/articles", articles);
      console.log("updated cache");
    };

    context.waitUntil(updateCache());

    console.log("sending response");

    return json({ received: true });
  }
);
```

---

TITLE: Querying Table and Index Sizes in PostgreSQL
DESCRIPTION: This SQL query retrieves the names and sizes of all user tables and their associated indexes in a PostgreSQL database. It uses `pg_size_pretty` for human-readable output and orders results by total relation size, helping to identify large tables and their index overhead.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2022-09-08-choosing-a-postgres-primary-key.mdx#_snippet_11

LANGUAGE: sql
CODE:

```
select
  relname as table_name,
  pg_size_pretty(pg_total_relation_size(relid)) as "Table Size",
  pg_size_pretty(pg_indexes_size(relid)) as "Index Size",
  pg_size_pretty(pg_relation_size(relid)) as "Total Size"
from pg_catalog.pg_statio_user_tables
order by pg_total_relation_size(relid) desc;
```

---

TITLE: Recreating Foreign Key Constraint with ON DELETE SET NULL (SQL)
DESCRIPTION: This SQL transaction drops an existing foreign key constraint and then recreates it with an 'ON DELETE SET NULL' modifier. This provides a less restrictive relationship, resolving authentication errors caused by overly strict constraints on 'auth.users'.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/resolving-500-status-authentication-errors-7bU5U8.mdx#_snippet_2

LANGUAGE: SQL
CODE:

```
BEGIN;
ALTER TABLE <your table> DROP CONSTRAINT <constraint name>;

ALTER TABLE <your table> ADD CONSTRAINT <constraint name> FOREIGN KEY (<column name>)
          REFERENCES auth.users (<auth.users column>)
          ON DELETE SET NULL;
COMMIT;
```

---

TITLE: Creating an INSERT Policy for User-Owned Profiles
DESCRIPTION: This SQL block sets up a `profiles` table, enables RLS, and then defines an `INSERT` policy. The policy ensures that only authenticated users can create a profile, and that the `user_id` they attempt to insert matches their own authenticated user ID, preventing unauthorized profile creation.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/row-level-security.mdx#_snippet_7

LANGUAGE: SQL
CODE:

```
create table profiles (
  id uuid primary key,
  user_id uuid references auth.users,
  avatar_url text
);

alter table profiles enable row level security;

create policy "Users can create a profile."
on profiles for insert
to authenticated                          -- the Postgres Role (recommended)
with check ( (select auth.uid()) = user_id );      -- the actual Policy
```

---

TITLE: Adding Cascading Foreign Key and Updating Data in SQL
DESCRIPTION: This SQL snippet adds a new mother column to the child table, establishing a foreign key relationship to the parent table with ON DELETE CASCADE. It then updates the mother column for an existing child record. This setup is crucial for demonstrating how NO ACTION INITIALLY DEFERRED interacts with other cascading constraints within the same transaction.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/cascade-deletes.mdx#_snippet_7

LANGUAGE: SQL
CODE:

```
alter table child
add column mother integer references parent (id)
  on delete cascade;

update child
set mother = 2
where id = 1;
```

---

TITLE: Conditionally Rendering MFA Challenge Screen in React with Supabase
DESCRIPTION: This React component, AppWithMFA, checks the user's Authenticator Assurance Level (AAL) using `supabase.auth.mfa.getAuthenticatorAssuranceLevel()` on component mount. If the `nextLevel` is 'aal2' and differs from the `currentLevel`, it sets `showMFAScreen` to true, rendering the `AuthMFA` component for a challenge; otherwise, it renders the main `App` component. The `readyToShow` state ensures no UI is displayed until the AAL check completes.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-mfa/phone.mdx#_snippet_1

LANGUAGE: tsx
CODE:

```
function AppWithMFA() {
  const [readyToShow, setReadyToShow] = useState(false)
  const [showMFAScreen, setShowMFAScreen] = useState(false)

  useEffect(() => {
    ;(async () => {
      try {
        const { data, error } = await supabase.auth.mfa.getAuthenticatorAssuranceLevel()
        if (error) {
          throw error
        }

        console.log(data)

        if (data.nextLevel === 'aal2' && data.nextLevel !== data.currentLevel) {
          setShowMFAScreen(true)
        }
      } finally {
        setReadyToShow(true)
      }
    })()
  }, [])

  if (readyToShow) {
    if (showMFAScreen) {
      return <AuthMFA />
    }

    return <App />
  }

  return <></>
}
```

---

TITLE: Handling OAuth Callback and Session Exchange in Next.js
DESCRIPTION: This Next.js API route (app/auth/callback/route.ts) processes the OAuth callback. It extracts the authorization code from the URL, exchanges it for a user session using supabase.auth.exchangeCodeForSession, and then redirects the user to their intended destination or an error page. It also handles potential x-forwarded-host headers for production environments.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/_partials/oauth_pkce_flow.mdx#_snippet_2

LANGUAGE: TypeScript
CODE:

```
import { NextResponse } from 'next/server'
// The client you created from the Server-Side Auth instructions
import { createClient } from '@/utils/supabase/server'

export async function GET(request: Request) {
  const { searchParams, origin } = new URL(request.url)
  const code = searchParams.get('code')
  // if "next" is in param, use it as the redirect URL
  let next = searchParams.get('next') ?? '/'
  if (!next.startsWith('/')) {
    // if "next" is not a relative URL, use the default
    next = '/'
  }

  if (code) {
    const supabase = await createClient()
    const { error } = await supabase.auth.exchangeCodeForSession(code)
    if (!error) {
      const forwardedHost = request.headers.get('x-forwarded-host') // original origin before load balancer
      const isLocalEnv = process.env.NODE_ENV === 'development'
      if (isLocalEnv) {
        // we can be sure that there is no load balancer in between, so no need to watch for X-Forwarded-Host
        return NextResponse.redirect(`${origin}${next}`)
      } else if (forwardedHost) {
        return NextResponse.redirect(`https://${forwardedHost}${next}`)
      } else {
        return NextResponse.redirect(`${origin}${next}`)
      }
    }
  }

  // return the user to an error page with instructions
  return NextResponse.redirect(`${origin}/auth/auth-code-error`)
}
```

---

TITLE: Implementing Server-Side Login and Signup Actions with Supabase (JavaScript)
DESCRIPTION: These server-side JavaScript functions (`login` and `signup`) handle user authentication with Supabase. They retrieve form data, call `supabase.auth.signInWithPassword` or `supabase.auth.signUp`, and then redirect the user based on the outcome. `revalidatePath` is used to ensure data freshness after authentication.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-nextjs.mdx#_snippet_10

LANGUAGE: JavaScript
CODE:

```
'use server'

import { revalidatePath } from 'next/cache'
import { redirect } from 'next/navigation'

import { createClient } from '@/utils/supabase/server'

export async function login(formData) {
  const supabase = await createClient()

  // type-casting here for convenience
  // in practice, you should validate your inputs
  const data = {
    email: formData.get('email'),
    password: formData.get('password'),
  }

  const { error } = await supabase.auth.signInWithPassword(data)

  if (error) {
    redirect('/error')
  }

  revalidatePath('/', 'layout')
  redirect('/account')
}

export async function signup(formData) {
  const supabase = await createClient()

  const data = {
    email: formData.get('email'),
    password: formData.get('password'),
  }

  const { error } = await supabase.auth.signUp(data)

  if (error) {
    redirect('/error')
  }

  revalidatePath('/', 'layout')
  redirect('/account')
}
```

---

TITLE: Creating SELECT Policies with Specific Postgres Roles
DESCRIPTION: These examples demonstrate how to create `SELECT` policies that grant access based on Postgres roles. The first policy allows both `authenticated` and `anon` (unauthenticated) users to view profiles, while the second restricts viewing to only `authenticated` users.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/row-level-security.mdx#_snippet_4

LANGUAGE: SQL
CODE:

```
create policy "Profiles are viewable by everyone"
on profiles for select
to authenticated, anon
using ( true );

-- OR

create policy "Public profiles are viewable only by authenticated users"
on profiles for select
to authenticated
using ( true );
```

---

TITLE: Signing Up Users with Custom Metadata using Supabase JS Client
DESCRIPTION: This snippet demonstrates how to register a new user with the Supabase JavaScript client's `signUp` function, including custom metadata such as `first_name`, `last_name`, and `age`. This metadata is stored in the `auth.raw_user_meta_data` column of the `auth.users` table and can be later accessed for various purposes, including email customization.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/customizing-emails-by-language-KZ_38Q.mdx#_snippet_0

LANGUAGE: javascript
CODE:

```
const { data, error } = await supabase.auth.signUp({
  email: 'email@some_[email.com](http://email.com/)',
  password: 'example-password',
  options: {
    data: {
      first_name: 'John',
      last_name: 'Doe',
      age: 27,
    },
  },
})
```

---

TITLE: Calling a PostgreSQL Stored Function with Supabase RPC (JavaScript)
DESCRIPTION: This JavaScript code demonstrates how to invoke a PostgreSQL stored function, `get_my_complex_query`, from a client application using the Supabase `rpc` method. It passes an object containing the `parameter` argument and includes promise-based error and response handling for asynchronous operations.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/certain-operations-are-too-complex-to-perform-directly-using-the-client-libraries-8JaphH.mdx#_snippet_1

LANGUAGE: JavaScript
CODE:

```
supabase.rpc("get_my_complex_query", { parameter: 1 })
  .then(response => {
    // Handle the response
  })
  .catch(error => {
    // Handle errors
  });
```

---

TITLE: Signing Out from Supabase (JavaScript)
DESCRIPTION: This JavaScript snippet demonstrates how to sign out a user from Supabase. The `signOut()` method removes the user's session from the browser and clears any related objects from localStorage, effectively ending the user's authenticated session.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/social-login/auth-azure.mdx#_snippet_4

LANGUAGE: JavaScript
CODE:

```
import { createClient } from '@supabase/supabase-js'
const supabase = createClient('https://your-project.supabase.co', 'your-anon-key')

// ---cut---
async function signOut() {
  const { error } = await supabase.auth.signOut()
}
```

---

TITLE: Signing Out from Supabase JS Client
DESCRIPTION: This JavaScript snippet shows how to sign out a user from their current session using the Supabase client. Calling `supabase.auth.signOut()` removes the user's session from the browser and clears relevant data from local storage.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/social-login/auth-facebook.mdx#_snippet_4

LANGUAGE: JavaScript
CODE:

```
import { createClient } from '@supabase/supabase-js'
const supabase = createClient('https://your-project.supabase.co', 'your-anon-key')

async function signOut() {
  const { error } = await supabase.auth.signOut()
}
```

---

TITLE: Implementing Authentication Check and Redirection in React
DESCRIPTION: This React component demonstrates how to secure a route by verifying the user's authentication status with Supabase. It uses the `useEffect` hook to asynchronously check if a user is logged in. If `client.auth.getUser()` returns an error, indicating no authenticated user, the component redirects to the `/login` route, protecting the content.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/ui-library/content/docs/react/password-based-auth.mdx#_snippet_1

LANGUAGE: ts
CODE:

```
import { useEffect } from "react"
import { createClient } from "@supabase/supabase-js"

export default function AuthenticatedRoute() {
  useEffect(() => {
    const checkAuth = async () => {
      const client = createClient()
      const { error } = await client.auth.getUser()

      if (error) {
        location.href = "/login"
      }
    }
    checkAuth()
  }, [])

  return <div>Authenticated page</div>;
}
```

---

TITLE: Generating and Storing Text Embeddings via Database Webhook - TypeScript
DESCRIPTION: This TypeScript Edge Function acts as a database webhook, triggered when a row is inserted or updated in the `embeddings` table. It uses the `Supabase.ai.Session` with the `gte-small` model to generate a vector embedding for the `content` field and then updates the corresponding row in the `embeddings` table with the generated embedding.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/functions/examples/semantic-search.mdx#_snippet_1

LANGUAGE: TypeScript
CODE:

```
const model = new Supabase.ai.Session('gte-small')

Deno.serve(async (req) => {
  const payload: WebhookPayload = await req.json()
  const { content, id } = payload.record

  // Generate embedding.
  const embedding = await model.run(content, {
    mean_pool: true,
    normalize: true,
  })

  // Store in database.
  const { error } = await supabase
    .from('embeddings')
    .update({ embedding: JSON.stringify(embedding) })
    .eq('id', id)
  if (error) console.warn(error.message)

  return new Response('ok')
})
```

---

TITLE: Executing Dynamic JavaScript via SQL `edge.exec` Function (SQL)
DESCRIPTION: This SQL query demonstrates how to invoke the `edge.exec` function, passing a JavaScript code string as a parameter. The JavaScript code then uses the `supabase.rpc` client to call a PostgreSQL function and includes error handling for robust execution.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2024-11-13-supabase-dynamic-functions.mdx#_snippet_10

LANGUAGE: SQL
CODE:

```
SELECT edge.exec(
  $js$
  const { data, error } = await supabase.rpc('postgres_function', {'foo': 'bar'});
  if (error) {
    return new Response(JSON.stringify({ error: "An error occurred ->" + error.message }), {
      status: 500,
      headers: { "Content-Type": "application/json" },
    });
  }
  return data;
  $js$
);
```

---

TITLE: Demonstrating Combined CASCADE and NO ACTION INITIALLY DEFERRED Behavior in PostgreSQL
DESCRIPTION: This shell snippet shows the result of deleting from the grandparent table when both CASCADE (on mother column) and NO ACTION INITIALLY DEFERRED (on father column) constraints are active. The CASCADE action takes precedence, deleting the child row, which then allows the parent and grandparent rows to be deleted without error, illustrating the deferral mechanism's utility.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/postgres/cascade-deletes.mdx#_snippet_8

LANGUAGE: Shell
CODE:

```
postgres=# delete from grandparent;
DELETE 1

postgres=# select * from parent;
 id | name | parent_id
----+------+-----------
(0 rows)

postgres=# select * from child;
 id | name | father | mother
----+------+--------+--------
(0 rows)
```

---

TITLE: Defining Update Policy for User Profiles - Supabase SQL
DESCRIPTION: This RLS policy allows users to update their own profile information. The 'using' clause restricts updates to profiles where the 'id' matches the authenticated user's ID (auth.uid()).
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/_partials/user_management_quickstart_sql_template.mdx#_snippet_3

LANGUAGE: SQL
CODE:

```
create policy "Users can update own profile." on profiles
  for update using ((select auth.uid()) = id);
```

---

TITLE: Retrieve User Metadata
DESCRIPTION: These code examples show how to retrieve the `user_metadata` associated with the currently authenticated user. The metadata is accessed from the `user` object, which contains the `raw_user_meta_data` stored during signup.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/managing-user-data.mdx#_snippet_3

LANGUAGE: JavaScript
CODE:

```
import { createClient } from '@supabase/supabase-js'
const supabase = createClient(process.env.SUPABASE_URL!, process.env.SUPABASE_KEY!)

// ---cut---
const {
  data: { user },
} = await supabase.auth.getUser()
let metadata = user?.user_metadata
```

LANGUAGE: Dart
CODE:

```
final User? user = supabase.auth.currentUser;
final Map<String, dynamic>? metadata = user?.userMetadata;
```

LANGUAGE: Swift
CODE:

```
let user = try await supabase.auth.user()
let metadata = user.userMetadata
```

LANGUAGE: Kotlin
CODE:

```
val user = supabase.auth.retrieveUserForCurrentSession()
//Or you can use the user from the current session:
val user = supabase.auth.currentUserOrNull()
val metadata = user?.userMetadata
```

---

TITLE: Retrieving Subscriber Last WAL Replay LSN (SQL)
DESCRIPTION: This SQL query returns the Log Sequence Number (LSN) of the last Write-Ahead Log (WAL) record that has been replayed on the subscriber database. This LSN indicates how far the replica has processed the WAL stream from the primary, helping to determine replication lag.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/replication/monitoring-replication.mdx#_snippet_5

LANGUAGE: SQL
CODE:

```
select pg_last_wal_replay_lsn();
```

---

TITLE: Creating a Stripe Products Foreign Table in Postgres
DESCRIPTION: This SQL statement defines a foreign table named `stripe.stripe_products` that maps to product data within a Stripe account. It specifies the table's columns, their data types, and options for connecting to the `stripe_fdw_server`, allowing Stripe product data to be queried as if it were a local Postgres table.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/database/extensions/wrappers/overview.mdx#_snippet_3

LANGUAGE: sql
CODE:

```
create foreign table stripe.stripe_products (
  id text,
  name text,
  active bool,
  default_price text,
  description text,
  created timestamp,
  updated timestamp,
  attrs jsonb
)
  server stripe_fdw_server
  options (
    object 'products',
    rowid_column 'id'
  );
```

---

TITLE: Defining a Basic Products Table with RLS in PostgreSQL
DESCRIPTION: This SQL snippet defines a `products` table with common columns like `id`, `name`, `category`, `price`, and `created_at`. It also demonstrates enabling Row Level Security (RLS) on the table, which is a crucial step for implementing fine-grained access control in PostgreSQL.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2025-04-03-declarative-schemas.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
create table "products" (
  id         bigint generated by default as identity,
  name       text not null,
  category   text,
  price      numeric(10, 2) not null,
  created_at timestamptz default now()
);

alter table "products"
enable row level security;
```

---

TITLE: Performing Semantic Search with RLS (SQL)
DESCRIPTION: This SQL query performs a semantic similarity search on `document_sections` using the `pgvector` extension. The RLS policy applied to `document_sections` ensures that only sections accessible to the current user are considered in the search, maintaining fine-grained access control.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/rag-with-permissions.mdx#_snippet_3

LANGUAGE: SQL
CODE:

```
-- Perform inner product similarity based on a match_threshold
select *
from document_sections
where document_sections.embedding <#> embedding < -match_threshold
order by document_sections.embedding <#> embedding;
```

---

TITLE: Configuring Supabase Environment Variables (env)
DESCRIPTION: This snippet defines the essential environment variables required for connecting a Tanstack Start project to a Supabase instance. `VITE_SUPABASE_URL` specifies the Supabase project URL, and `VITE_SUPABASE_ANON_KEY` holds the public anonymous key for client-side access. These values are crucial for initializing the Supabase client and enabling authentication.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/ui-library/content/docs/tanstack/social-auth.mdx#_snippet_0

LANGUAGE: env
CODE:

```
VITE_SUPABASE_URL=
VITE_SUPABASE_ANON_KEY=
```

---

TITLE: Implementing Supabase Magic Link Login Page in Flutter
DESCRIPTION: This Flutter `LoginPage` widget handles user sign-in using Supabase's magic link authentication. It listens for authentication state changes to redirect users upon successful login and provides a UI for email input and sending magic links.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/tutorials/with-flutter.mdx#_snippet_6

LANGUAGE: dart
CODE:

```
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_quickstart/main.dart';
import 'package:supabase_quickstart/pages/account_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  bool _redirecting = false;
  late final TextEditingController _emailController = TextEditingController();
  late final StreamSubscription<AuthState> _authStateSubscription;

  Future<void> _signIn() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await supabase.auth.signInWithOtp(
        email: _emailController.text.trim(),
        emailRedirectTo:
            kIsWeb ? null : 'io.supabase.flutterquickstart://login-callback/',
      );
      if (mounted) {
        context.showSnackBar('Check your email for a login link!');

        _emailController.clear();
      }
    } on AuthException catch (error) {
      if (mounted) context.showSnackBar(error.message, isError: true);
    } catch (error) {
      if (mounted) {
        context.showSnackBar('Unexpected error occurred', isError: true);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen(
      (data) {
        if (_redirecting) return;
        final session = data.session;
        if (session != null) {
          _redirecting = true;
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const AccountPage()),
          );
        }
      },
      onError: (error) {
        if (error is AuthException) {
          context.showSnackBar(error.message, isError: true);
        } else {
          context.showSnackBar('Unexpected error occurred', isError: true);
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _authStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          const Text('Sign in via the magic link with your email below'),
          const SizedBox(height: 18),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: _isLoading ? null : _signIn,
            child: Text(_isLoading ? 'Sending...' : 'Send Magic Link'),
          ),
        ],
      ),
    );
  }
}
```

---

TITLE: React Component for Unenrolling Supabase MFA Factors
DESCRIPTION: This React `UnenrollMFA` component provides a user interface to list and unenroll Multi-Factor Authentication (MFA) factors. It fetches existing factors using `supabase.auth.mfa.listFactors()` on component mount, displays them in a table, and allows users to unenroll a selected factor by its ID via `supabase.auth.mfa.unenroll()`. This component requires `useState` and `useEffect` from React, and the Supabase client.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-mfa.mdx#_snippet_1

LANGUAGE: tsx
CODE:

```
/**
 * UnenrollMFA shows a simple table with the list of factors together with a button to unenroll.
 * When a user types in the factorId of the factor that they wish to unenroll and clicks unenroll
 * the corresponding factor will be unenrolled.
 */
export function UnenrollMFA() {
  const [factorId, setFactorId] = useState('')
  const [factors, setFactors] = useState([])
  const [error, setError] = useState('') // holds an error message

  useEffect(() => {
    ;(async () => {
      const { data, error } = await supabase.auth.mfa.listFactors()
      if (error) {
        throw error
      }

      setFactors([...data.totp, ...data.phone])
    })()
  }, [])

  return (
    <>
      {error && <div className="error">{error}</div>}
      <tbody>
        <tr>
          <td>Factor ID</td>
          <td>Friendly Name</td>
          <td>Factor Status</td>
          <td>Phone Number</td>
        </tr>
        {factors.map((factor) => (
          <tr>
            <td>{factor.id}</td>
            <td>{factor.friendly_name}</td>
            <td>{factor.factor_type}</td>
            <td>{factor.status}</td>
            <td>{factor.phone}</td>
          </tr>
        ))}
      </tbody>
      <input type="text" value={verifyCode} onChange={(e) => setFactorId(e.target.value.trim())} />
      <button onClick={() => supabase.auth.mfa.unenroll({ factorId })}>Unenroll</button>
    </>
  )
}
```

---

TITLE: Selecting Data with Basic Clauses in Supabase JavaScript API
DESCRIPTION: This snippet demonstrates how to select specific columns from a table, apply WHERE clause filters using gte, lte, and not operators, and order the results using order with ascending/descending options, finally limiting the number of rows. It shows the conversion from a standard SQL SELECT statement.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/api/sql-to-api.mdx#_snippet_0

LANGUAGE: sql
CODE:

```
select first_name, last_name, team_id, age
from players
where age between 20 and 24 and team_id != 'STL'
order by last_name, first_name desc
limit 20;
```

LANGUAGE: javascript
CODE:

```
const { data, error } = await supabase
  .from('players')
  .select('first_name,last_name,team_id,age')
  .gte('age', 20)
  .lte('age', 24)
  .not('team_id', 'eq', 'STL')
  .order('last_name', { ascending: true }) // or just .order('last_name')
  .order('first_name', { ascending: false })
  .limit(20)
```

---

TITLE: Creating Next.js App with Supabase Template (Bash)
DESCRIPTION: This command initializes a new Next.js application using the `create-next-app` utility. It specifically leverages the `with-supabase` template, which pre-configures the project with cookie-based authentication, TypeScript support, and Tailwind CSS for styling, streamlining the setup process for Supabase integration.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/getting-started/quickstarts/nextjs.mdx#_snippet_0

LANGUAGE: bash
CODE:

```
npx create-next-app -e with-supabase
```

---

TITLE: Setting Row-Level Security Policy for Realtime Broadcasts - SQL
DESCRIPTION: This SQL snippet defines a Row-Level Security (RLS) policy for the `realtime.messages` table. It grants `SELECT` access to authenticated users, allowing them to receive broadcast messages. This is a crucial security step to control who can access real-time data.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2025-04-02-realtime-broadcast-from-database.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
create policy "Authenticated users can receive broadcasts"
on "realtime"."messages"
for select
to authenticated
using ( true );
```

---

TITLE: Initializing Supabase Server Client in Remix Action
DESCRIPTION: This code illustrates how to initialize a server-side Supabase client within a Remix action function. Similar to loaders, it handles cookie parsing from the request and serializes new cookies into the response headers, ensuring that authentication state is correctly managed during form submissions or other mutations.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/server-side/creating-a-client.mdx#_snippet_25

LANGUAGE: TypeScript
CODE:

```
import { type ActionFunctionArgs } from '@remix-run/node'
import { createServerClient, parseCookieHeader, serializeCookieHeader } from '@supabase/ssr'

export async function action({ request }: ActionFunctionArgs) {
  const headers = new Headers()

  const supabase = createServerClient(process.env.SUPABASE_URL!, process.env.SUPABASE_ANON_KEY!, {
    cookies: {
      getAll() {
        return parseCookieHeader(request.headers.get('Cookie') ?? '')
      },
      setAll(cookiesToSet) {
        cookiesToSet.forEach(({ name, value, options }) =>
          headers.append('Set-Cookie', serializeCookieHeader(name, value, options))
        )
      },
    },
  })

  return new Response('...', {
    headers,
  })
}
```

---

TITLE: Serving ChatGPT Plugin Manifest with Supabase Edge Runtime (TypeScript)
DESCRIPTION: This snippet demonstrates how to serve the `ai-plugin.json` manifest file from a Deno function on Supabase Edge Runtime. Since static file hosting is not directly supported, it imports the JSON file and returns it as a `Response` object with appropriate CORS and content-type headers, making it accessible at the root of the domain.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-05-15-building-chatgpt-plugins-template.mdx#_snippet_0

LANGUAGE: TypeScript
CODE:

```
// functions/main/index.ts
import aiPlugins from './ai-plugins.json' with { type: 'json' }

// [...]

// Serve /.well-known/ai-plugin.json
if (service_name === '.well-known') {
  return new Response(JSON.stringify(aiPlugins), {
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
  })
}
```

---

TITLE: Creating Supabase Storage Access Policy for User Folders - SQL
DESCRIPTION: This SQL policy ensures that users can only access files within their own designated folders in the 'files' storage bucket. It uses `auth.uid()` to restrict access, allowing users to upload, read, and manage files only if the folder name matches their authenticated user ID. This enhances data security and privacy.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2023-08-01-react-native-storage.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
CREATE POLICY "Enable storage access for users based on user_id" ON "storage"."objects"
AS PERMISSIVE FOR ALL
TO public
USING (bucket_id = 'files' AND (SELECT auth.uid()::text )= (storage.foldername(name))[1])
WITH CHECK (bucket_id = 'files' AND (SELECT auth.uid()::text) = (storage.foldername(name))[1])
```

---

TITLE: Logging in to Supabase CLI
DESCRIPTION: This command logs you into the Supabase CLI, typically using an auto-generated Personal Access Token, which is a prerequisite for interacting with your Supabase projects remotely.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/deployment/database-migrations.mdx#_snippet_10

LANGUAGE: bash
CODE:

```
supabase login
```

---

TITLE: Create dequeue_and_run_jobs PL/pgSQL Function
DESCRIPTION: This PL/pgSQL function periodically dequeues and processes jobs from the `job_queue`. It selects pending jobs that are scheduled to run, updates their status to 'completed' upon success, and implements a retry mechanism for failures, delaying retries by one minute up to a maximum number of attempts.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-hooks/send-email-hook.mdx#_snippet_5

LANGUAGE: PL/pgSQL
CODE:

```
create or replace function dequeue_and_run_jobs() returns void as $$
declare
    job record;
begin
    for job in
        select * from job_queue
        where status = 'pending'
          and scheduled_at <= now()
        order by priority desc, created_at
        for update skip locked
    loop
        begin
            -- add job processing logic here.
            -- for demonstration, we'll just update the job status to 'completed'.
            update job_queue
            set status = 'completed'
            where job_id = job.job_id;

        exception when others then
            -- handle job failure and retry logic
            if job.retry_count < job.max_retries then
                update job_queue
                set retry_count = retry_count + 1,
                    scheduled_at = now() + interval '1 minute'  -- delay retry by 1 minute
                where job_id = job.job_id;
            else
                update job_queue
                set status = 'failed'
                where job_id = job.job_id;
            end if;
        end;
    end loop;
end;
$$ language plpgsql;
```

---

TITLE: Interpreting Detailed EXPLAIN ANALYZE Output (PostgreSQL EXPLAIN)
DESCRIPTION: This example illustrates a detailed output from `EXPLAIN ANALYZE`, showing actual execution statistics alongside estimated costs. It highlights key metrics like `actual time`, `Rows Removed by Filter`, and `Planning Time`, which are crucial for identifying performance bottlenecks and understanding the query planner's efficiency.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/troubleshooting/understanding-postgresql-explain-output-Un9dqX.mdx#_snippet_2

LANGUAGE: PostgreSQL EXPLAIN
CODE:

```
Seq Scan on users  (cost=0.00..19.00 rows=1 width=240) (actual time=0.026..0.026 rows=1 loops=1)
  Filter: (user_id = 1)
  Rows Removed by Filter: 999
Planning Time: 0.135 ms
```

---

TITLE: Initializing Supabase Client with TypeScript Types
DESCRIPTION: Demonstrates how to initialize the Supabase client (`supabase-js`) by providing the generated `Database` TypeScript type. This enables full type-safety when interacting with your Supabase API, ensuring correct data structures for queries and mutations.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/api/rest/generating-types.mdx#_snippet_7

LANGUAGE: ts
CODE:

```
import { createClient } from '@supabase/supabase-js'
import { Database } from './database.types'

const supabase = createClient<Database>(process.env.SUPABASE_URL, process.env.SUPABASE_ANON_KEY)
```

---

TITLE: Enabling pgvector Extension in Postgres
DESCRIPTION: This SQL command enables the `pgvector` extension within your PostgreSQL database, placing it under the `extensions` schema. This extension is crucial for efficient storage and retrieval of high-dimensional vectors, which are used for semantic search.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/ai/semantic-search.mdx#_snippet_0

LANGUAGE: SQL
CODE:

```
create extension vector
with
  schema extensions;
```

---

TITLE: Initializing Supabase Client in React (JavaScript)
DESCRIPTION: This JavaScript snippet demonstrates how to initialize the Supabase client within a React application using `createClient` from `@supabase/supabase-js`. It configures the client with the local Supabase URL and the anonymous public key, enabling interaction with the Supabase backend services.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/www/_blog/2021-03-31-supabase-cli.mdx#_snippet_3

LANGUAGE: javascript
CODE:

```
import { createClient } from '@supabase/supabase-js'
const SUPABASE_URL = 'http://localhost:8000'
const SUPABASE_ANON_KEY =
  'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJzdXBhYmFzZSIsImlhdCI6MTYwMzk2ODgzNCwiZXhwIjoyNTUwNjUzNjM0LCJyb2xlIjoiYW5vbiJ9.36fUebxgx1mcBo4s19v0SzqmzunP--hm_hep0uLX0ew'
const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY)
```

---

TITLE: Defining Insert Policy for User Profiles - Supabase SQL
DESCRIPTION: This RLS policy grants users permission to insert new profile entries. The 'with check' clause ensures that a user can only insert a profile where the 'id' matches their authenticated user ID (auth.uid()).
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/_partials/user_management_quickstart_sql_template.mdx#_snippet_2

LANGUAGE: SQL
CODE:

```
create policy "Users can insert their own profile." on profiles
  for insert with check ((select auth.uid()) = id);
```

---

TITLE: Implementing Basic Login/Signup Form with Next.js and Supabase Auth
DESCRIPTION: This snippet demonstrates a simple login form in Next.js using standard HTML form actions to interact with Supabase authentication routes. It includes fields for email and password, along with buttons for signing in, signing up, and signing out, leveraging Next.js's form action handling for authentication flows.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/nextjs.mdx#_snippet_14

LANGUAGE: jsx
CODE:

```
export default function Login() {
  return (
    <form action="/auth/login" method="post">
      <label htmlFor="email">Email</label>
      <input name="email" />
      <label htmlFor="password">Password</label>
      <input type="password" name="password" />
      <button>Sign In</button>
      <button formAction="/auth/sign-up">Sign Up</button>
      <button formAction="/auth/logout">Sign Out</button>
    </form>
  )
}
```

LANGUAGE: tsx
CODE:

```
export default function Login() {
  return (
    <form action="/auth/login" method="post">
      <label htmlFor="email">Email</label>
      <input name="email" />
      <label htmlFor="password">Password</label>
      <input type="password" name="password" />
      <button>Sign In</button>
      <button formAction="/auth/sign-up">Sign Up</button>
    </form>
  )
}
```

---

TITLE: Signing Out Users from Supabase
DESCRIPTION: This snippet illustrates how to sign out a user from their current session using the Supabase client library. Calling `signOut()` removes the user's session from the browser or device's local storage, effectively logging them out.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/social-login/auth-zoom.mdx#_snippet_1

LANGUAGE: JavaScript
CODE:

```
import { createClient } from '@supabase/supabase-js'
const supabase = createClient('<your-project-url>', '<your-anon-key>')

// ---cut---
async function signOut() {
  const { error } = await supabase.auth.signOut()
}
```

LANGUAGE: Dart
CODE:

```
Future<void> signOut() async {
  await supabase.auth.signOut();
}
```

LANGUAGE: Kotlin
CODE:

```
suspend fun signOut() {
	supabase.auth.signOut()
}
```

---

TITLE: Implementing Password Verification Rate Limit Hook (SQL)
DESCRIPTION: Defines a PostgreSQL function `hook_password_verification_attempt` that acts as a Supabase password verification hook. It checks if a password is valid, enforces a 10-second cooldown on failed attempts by querying and updating `password_failed_verification_attempts`, and returns a decision to continue or reject based on the rate limit. Appropriate permissions are granted to `supabase_auth_admin`.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-hooks/password-verification-hook.mdx#_snippet_4

LANGUAGE: sql
CODE:

```
create function public.hook_password_verification_attempt(event jsonb)
returns jsonb
language plpgsql
as $$
  declare
    last_failed_at timestamp;
  begin
    if event->'valid' is true then
      -- password is valid, accept it
      return jsonb_build_object('decision', 'continue');
    end if;

    select last_failed_at into last_failed_at
      from public.password_failed_verification_attempts
      where
        user_id = event->'user_id';

    if last_failed_at is not null and now() - last_failed_at < interval '10 seconds' then
      -- last attempt was done too quickly
      return jsonb_build_object(
        'error', jsonb_build_object(
          'http_code', 429,
          'message',   'Please wait a moment before trying again.'
        )
      );
    end if;

    -- record this failed attempt
    insert into public.password_failed_verification_attempts
      (
        user_id,
        last_failed_at
      )
      values
      (
        event->'user_id',
        now()
      )
      on conflict do update
        set last_failed_at = now();

    -- finally let Supabase Auth do the default behavior for a failed attempt
    return jsonb_build_object('decision', 'continue');
  end;
$$;

-- Assign appropriate permissions
grant all
  on table public.password_failed_verification_attempts
  to supabase_auth_admin;

revoke all
  on table public.password_failed_verification_attempts
  from authenticated, anon, public;
```

---

TITLE: Implementing Supabase Authentication in Remix Component (TypeScript)
DESCRIPTION: This React component demonstrates various Supabase authentication methods: email/password login, GitHub OAuth login, and user logout. It accesses the typed Supabase client via `useOutletContext` and provides button handlers for each authentication action.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/remix.mdx#_snippet_24

LANGUAGE: tsx
CODE:

```
export default function Login() {
  const { supabase } = useOutletContext<{ supabase: SupabaseClient<Database> }>()

  const handleEmailLogin = async () => {
    await supabase.auth.signInWithPassword({
      email: 'valid.email@supabase.io',
      password: 'password',
    })
  }

  const handleGitHubLogin = async () => {
    await supabase.auth.signInWithOAuth({
      provider: 'github',
      options: {
        redirectTo: 'http://localhost:3000/auth/callback',
      },
    })
  }

  const handleLogout = async () => {
    await supabase.auth.signOut()
  }

  return (
    <>
      <button onClick={handleEmailLogin}>Email Login</button>
      <button onClick={handleGitHubLogin}>GitHub Login</button>
      <button onClick={handleLogout}>Logout</button>
    </>
  )
}
```

---

TITLE: Generated TypeScript Types for `public.movies` Table
DESCRIPTION: This TypeScript interface shows the structure of types automatically generated by Supabase for the `public.movies` table. It includes `Row`, `Insert`, and `Update` types, reflecting database constraints like `not null` and generated columns.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/docs/ref/javascript/typescript-support.mdx#_snippet_2

LANGUAGE: ts
CODE:

```
export type Json = string | number | boolean | null | { [key: string]: Json | undefined } | Json[]

export interface Database {
  public: {
    Tables: {
      movies: {
        Row: {               // the data expected from .select()
          id: number
          name: string
          data: Json | null
        }
        Insert: {            // the data to be passed to .insert()
          id?: never         // generated columns must not be supplied
          name: string       // `not null` columns with no default must be supplied
          data?: Json | null // nullable columns can be omitted
        }
        Update: {            // the data to be passed to .update()
          id?: never
          name?: string      // `not null` columns are optional on .update()
          data?: Json | null
        }
      }
    }
  }
}
```

---

TITLE: Streaming Realtime Data with Supabase Dart
DESCRIPTION: This snippet illustrates the updated approach for streaming data from a Supabase table. The 'Before' version used a specific table string format for filtering and required `.execute()`. The 'After' version simplifies filtering with `.eq()` and makes `primaryKey` a named parameter, removing the need for `.execute()`.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/docs/ref/dart/v0/upgrade-guide.mdx#_snippet_27

LANGUAGE: Dart
CODE:

```
supabase.from('my_table:id=eq.120')
  .stream(['id'])
  .listen();
```

LANGUAGE: Dart
CODE:

```
supabase.from('my_table')
  .stream(primaryKey: ['id'])
  .eq('id', '120')
  .listen();
```

---

TITLE: Implementing Supabase Code Exchange Route in SvelteKit (JavaScript)
DESCRIPTION: This JavaScript snippet defines a GET endpoint at `src/routes/auth/callback/+server.js` for the Supabase server-side auth flow. It extracts the `code` from the URL search parameters, exchanges it for a user session using `supabase.auth.exchangeCodeForSession`, and then redirects the user to the homepage. This route is essential for handling authentication callbacks.
SOURCE: https://github.com/supabase/supabase/blob/master/apps/docs/content/guides/auth/auth-helpers/sveltekit.mdx#_snippet_4

LANGUAGE: js
CODE:

```
import { redirect } from '@sveltejs/kit'

export const GET = async ({ url, locals: { supabase } }) => {
  const code = url.searchParams.get('code')

  if (code) {
    await supabase.auth.exchangeCodeForSession(code)
  }

  redirect(303, '/')
}
```
