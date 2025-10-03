# WordPress REST API

Learn to interact with WordPress data using the REST API, create custom endpoints, and build headless WordPress applications.

---

## WordPress REST API Study Plan

This comprehensive **3-week study plan** is based on the official [WordPress REST API Handbook](https://developer.wordpress.org/rest-api/). Follow this structured approach to master the WordPress REST API.

---

## Table of Contents

- [Week 1: REST API Fundamentals](#week-1-rest-api-fundamentals)
- [Week 2: Using the REST API](#week-2-using-the-rest-api)
- [Week 3: Extending the REST API](#week-3-extending-the-rest-api)
- [Additional Resources](#additional-resources)

---

## Week 1: REST API Fundamentals

> **Goal:** Understand what REST APIs are and how the WordPress REST API works

### Day 1: Introduction to REST API

**📖 Reading:**

- [REST API Handbook](https://developer.wordpress.org/rest-api/)
- [What Is A REST API?](https://developer.wordpress.org/rest-api/#what-is-a-rest-api)
- [Key Concepts](https://developer.wordpress.org/rest-api/key-concepts/)

**📝 Topics:**

- What is REST (REpresentational State Transfer)
- JSON (JavaScript Object Notation) format
- HTTP methods (GET, POST, PUT, DELETE)
- How WordPress REST API works
- REST API vs other WordPress APIs

**✏️ Practice:**

- Access your site's REST API root: `https://yoursite.com/wp-json/`
- Explore available endpoints
- View JSON responses in browser or Postman

---

### Day 2: API Structure & Resources

**📖 Reading:**

- [Reference Overview](https://developer.wordpress.org/rest-api/reference/)

**📝 Core Resources:**

- Posts (`/wp/v2/posts`)
- Pages (`/wp/v2/pages`)
- Categories (`/wp/v2/categories`)
- Tags (`/wp/v2/tags`)
- Users (`/wp/v2/users`)
- Comments (`/wp/v2/comments`)
- Media (`/wp/v2/media`)

**✏️ Practice:**

- Test each core endpoint using browser or cURL
- Understand the JSON structure of responses
- Identify common fields across resources

---

### Day 3: Discovery & Global Parameters

**📖 Reading:**

- [Discovery](https://developer.wordpress.org/rest-api/using-the-rest-api/discovery/)
- [Global Parameters](https://developer.wordpress.org/rest-api/using-the-rest-api/global-parameters/)

**📝 Topics:**

- API discovery mechanism
- `_fields` parameter (field filtering)
- `context` parameter (view, embed, edit)
- `_embed` parameter (embedding resources)
- Error responses and status codes

**✏️ Practice:**

- Use `_fields` to request specific fields only
- Test different `context` values
- Use `_embed` to include related resources
- Handle error responses

---

### Day 4-5: Pagination & Linking

**📖 Reading:**

- [Pagination](https://developer.wordpress.org/rest-api/using-the-rest-api/pagination/)
- [Linking and Embedding](https://developer.wordpress.org/rest-api/using-the-rest-api/linking-and-embedding/)

**📝 Topics:**

- Pagination parameters (`per_page`, `page`)
- Pagination headers (`X-WP-Total`, `X-WP-TotalPages`)
- HATEOAS (Hypermedia as the Engine of Application State)
- `_links` in responses
- Embedded resources

**🔍 Pagination Parameters:**

- `per_page` - Number of items per request (max 100)
- `page` - Current page number
- `offset` - Number of items to skip
- `orderby` - Field to sort by
- `order` - Sort direction (asc/desc)

**✏️ Practice:**

- Implement pagination in API requests
- Parse pagination headers
- Use `_embed` for efficient data fetching
- Navigate through `_links` relationships

---

### Day 6-7: Weekend Project

**Project:** Create a "Blog Post Viewer" web page

**Requirements:**

- ✅ Fetch and display posts from WordPress REST API
- ✅ Implement pagination (next/previous)
- ✅ Show post title, excerpt, date, author
- ✅ Display featured image using `_embed`
- ✅ Filter by category or tag
- ✅ Handle loading and error states
- ✅ Use vanilla JavaScript or your preferred framework

**Deliverable:** A working web page that consumes WordPress REST API data.

---

## Week 2: Using the REST API

> **Goal:** Master API authentication, querying, and client-side implementation

### Day 1-2: Authentication

**📖 Reading:**

- [Authentication](https://developer.wordpress.org/rest-api/using-the-rest-api/authentication/)
- [Application Passwords](https://developer.wordpress.org/rest-api/reference/application-passwords/)

**📝 Authentication Methods:**

- **Cookie Authentication** - For same-origin requests
- **Application Passwords** - For external applications
- **OAuth Authentication** - For third-party apps
- **JWT (JSON Web Tokens)** - Via plugins

**⚙️ Cookie Authentication:**
```javascript
// Add nonce to requests
fetch('/wp-json/wp/v2/posts', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'X-WP-Nonce': wpApiSettings.nonce
  },
  body: JSON.stringify({
    title: 'My Post',
    content: 'Post content',
    status: 'publish'
  })
});
```

**🔐 Application Passwords:**
```bash
# Basic Auth with Application Password
curl -u "username:xxxx xxxx xxxx xxxx xxxx xxxx" \
  https://example.com/wp-json/wp/v2/users/me
```

**✏️ Practice:**

- Create application passwords
- Make authenticated requests
- Implement cookie authentication in JavaScript
- Test different authentication methods

---

### Day 3: Client Libraries

**📖 Reading:**

- [Client Libraries](https://developer.wordpress.org/rest-api/using-the-rest-api/client-libraries/)
- [Backbone JavaScript Client](https://developer.wordpress.org/rest-api/using-the-rest-api/backbone-javascript-client/)

**📚 Popular Libraries:**

- **Backbone.js** (built-in WordPress)
- **wpapi** (Node.js)
- **wordpress-rest-api-oauth** (OAuth)
- Language-specific clients (PHP, Python, Ruby, etc.)

**✏️ Practice:**

- Use wp-api Backbone.js models
- Try a REST API client library
- Compare raw fetch vs client library

---

### Day 4-5: Working with Resources

**📖 Reading:**

- [Posts Reference](https://developer.wordpress.org/rest-api/reference/posts/)
- [Pages Reference](https://developer.wordpress.org/rest-api/reference/pages/)
- [Media Reference](https://developer.wordpress.org/rest-api/reference/media/)
- [Users Reference](https://developer.wordpress.org/rest-api/reference/users/)
- [Comments Reference](https://developer.wordpress.org/rest-api/reference/comments/)

**🔧 CRUD Operations:**

**Create:**
```javascript
// Create a post
fetch('/wp-json/wp/v2/posts', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'X-WP-Nonce': nonce
  },
  body: JSON.stringify({
    title: 'New Post',
    content: 'Post content',
    status: 'publish'
  })
});
```

**Update:**
```javascript
// Update a post
fetch('/wp-json/wp/v2/posts/123', {
  method: 'POST', // or PUT
  headers: {
    'Content-Type': 'application/json',
    'X-WP-Nonce': nonce
  },
  body: JSON.stringify({
    title: 'Updated Title'
  })
});
```

**Delete:**
```javascript
// Delete a post
fetch('/wp-json/wp/v2/posts/123', {
  method: 'DELETE',
  headers: {
    'X-WP-Nonce': nonce
  }
});
```

**✏️ Practice:**
- Create posts via API
- Update existing posts
- Delete posts
- Upload media files
- Create and manage comments
- Work with users endpoint

---

### Day 6-7: Weekend Project

**Project:** Create a "Simple CMS Dashboard"

**Requirements:**

- ✅ **Authentication:**
  - Login with application passwords or cookies
  - Show authenticated user info
- ✅ **Post Management:**
  - List all posts with pagination
  - Create new posts
  - Edit existing posts
  - Delete posts
  - Publish/draft status control
- ✅ **Media Management:**
  - Upload images
  - Insert images in posts
- ✅ **Categories & Tags:**
  - Assign categories and tags to posts
- ✅ **User Experience:**
  - Loading states
  - Error handling
  - Success notifications

**Deliverable:** A functional content management interface using REST API.

---

## Week 3: Extending the REST API

> **Goal:** Create custom endpoints and extend existing resources

### Day 1-2: Custom Endpoints

**📖 Reading:**

- [Adding Custom Endpoints](https://developer.wordpress.org/rest-api/extending-the-rest-api/adding-custom-endpoints/)
- [Routes and Endpoints](https://developer.wordpress.org/rest-api/extending-the-rest-api/routes-and-endpoints/)

**📝 Topics:**

- `register_rest_route()` function
- Namespace and route patterns
- HTTP methods and callbacks
- Permission callbacks
- Arguments and validation

**⚙️ Basic Custom Endpoint:**
```php
add_action('rest_api_init', function () {
  register_rest_route('myplugin/v1', '/author/(?P<id>\d+)', array(
    'methods' => 'GET',
    'callback' => 'myplugin_get_author',
    'permission_callback' => '__return_true',
    'args' => array(
      'id' => array(
        'validate_callback' => function($param) {
          return is_numeric($param);
        }
      ),
    ),
  ));
});

function myplugin_get_author($request) {
  $author = get_user_by('id', $request['id']);
  
  if (!$author) {
    return new WP_Error('no_author', 'Invalid author', array('status' => 404));
  }
  
  return array(
    'id' => $author->ID,
    'name' => $author->display_name,
    'email' => $author->user_email
  );
}
```

**✏️ Practice:**

- Create a simple GET endpoint
- Create a POST endpoint with data validation
- Implement permission callbacks
- Return proper error responses

---

### Day 3: Controller Classes

**📖 Reading:**

- [Controller Classes](https://developer.wordpress.org/rest-api/extending-the-rest-api/controller-classes/)

**📝 Topics:**

- Extending `WP_REST_Controller`
- Standard CRUD methods
- Index, create, update, delete patterns
- Schema definitions
- Consistent API design

**⚙️ Controller Example:**
```php
class My_REST_Controller extends WP_REST_Controller {
  public function register_routes() {
    register_rest_route('myplugin/v1', '/items', array(
      array(
        'methods' => WP_REST_Server::READABLE,
        'callback' => array($this, 'get_items'),
        'permission_callback' => array($this, 'get_items_permissions_check'),
      ),
      array(
        'methods' => WP_REST_Server::CREATABLE,
        'callback' => array($this, 'create_item'),
        'permission_callback' => array($this, 'create_item_permissions_check'),
      ),
    ));
  }
  
  public function get_items($request) {
    // Implementation
  }
  
  public function create_item($request) {
    // Implementation
  }
}
```

**✏️ Practice:**

- Create a custom controller class
- Implement CRUD operations
- Define schema for your resource

---

### Day 4: Adding REST Support to Custom Content

**📖 Reading:**

- [Adding REST API Support For Custom Content Types](https://developer.wordpress.org/rest-api/extending-the-rest-api/adding-rest-api-support-for-custom-content-types/)
- [Schema](https://developer.wordpress.org/rest-api/extending-the-rest-api/schema/)

**📝 Topics:**

- Enable REST API for custom post types
- Enable REST API for custom taxonomies
- Custom meta fields in REST API
- `show_in_rest` parameter
- `rest_base` parameter
- Schema definitions

**⚙️ Custom Post Type with REST API:**
```php
register_post_type('book', array(
  'public' => true,
  'label'  => 'Books',
  'show_in_rest' => true,
  'rest_base' => 'books',
  'rest_controller_class' => 'WP_REST_Posts_Controller',
  'supports' => array('title', 'editor', 'custom-fields'),
));

// Register custom meta in REST API
register_post_meta('book', 'isbn', array(
  'show_in_rest' => true,
  'single' => true,
  'type' => 'string',
));
```

**✏️ Practice:**

- Add REST API support to custom post type
- Add REST API support to custom taxonomy
- Register custom meta fields
- Test custom endpoints

---

### Day 5: Modifying Responses

**📖 Reading:**

- [Modifying Responses](https://developer.wordpress.org/rest-api/extending-the-rest-api/modifying-responses/)

**📝 Topics:**

- `register_rest_field()` function
- Adding custom fields to responses
- Modifying existing fields
- Get and update callbacks
- Schema for custom fields

**⚙️ Add Custom Field:**

```php
add_action('rest_api_init', function () {
  register_rest_field('post', 'custom_field', array(
    'get_callback' => function($post) {
      return get_post_meta($post['id'], 'custom_field', true);
    },
    'update_callback' => function($value, $post) {
      return update_post_meta($post->ID, 'custom_field', $value);
    },
    'schema' => array(
      'description' => 'Custom field description',
      'type' => 'string',
    ),
  ));
});
```

**✏️ Practice:**

- Add custom fields to posts endpoint
- Add computed fields (e.g., reading time)
- Modify user endpoint responses
- Add custom fields with proper schema

---

### Day 6-7: Weekend Project

**Project:** Create a "Portfolio REST API Plugin"

**Requirements:**

- ✅ **Custom Post Type:**
  - Register "Portfolio" custom post type
  - Enable REST API support
  - Custom fields: client, project_url, technologies
- ✅ **Custom Taxonomy:**
  - Register "Project Type" taxonomy
  - Enable REST API support
- ✅ **Custom Endpoints:**
  - `/myplugin/v1/portfolio/featured` - Get featured projects
  - `/myplugin/v1/portfolio/stats` - Get portfolio statistics
  - `/myplugin/v1/portfolio/search` - Custom search endpoint
- ✅ **Extended Responses:**
  - Add custom fields to portfolio endpoint
  - Add related projects field
  - Add project metadata
- ✅ **Controller Class:**
  - Use proper controller pattern
  - Implement all CRUD operations
  - Define proper schema
- ✅ **Documentation:**
  - Document all endpoints
  - Provide usage examples

**Deliverable:** A complete plugin with custom REST API implementation.

---

## Additional Resources

### Official Documentation

- **[WordPress REST API Handbook](https://developer.wordpress.org/rest-api/)** - Complete REST API documentation
- **[REST API Reference](https://developer.wordpress.org/rest-api/reference/)** - All available endpoints
- **[REST API Glossary](https://developer.wordpress.org/rest-api/glossary/)** - Key terms and concepts

### Tools & Testing

- **[Postman](https://www.postman.com/)** - API testing tool
- **[Insomnia](https://insomnia.rest/)** - REST client
- **[WP REST API Console](https://wordpress.org/plugins/rest-api-console/)** - WordPress plugin for testing
- **[REST API Handbook Console](https://developer.wordpress.org/rest-api/using-the-rest-api/)** - Online testing

### Client Libraries

- **[node-wpapi](https://github.com/WP-API/node-wpapi)** - Node.js client
- **[wordpress-rest-api-oauth](https://github.com/WP-API/wordpress-rest-api-oauth-1)** - OAuth plugin
- **[Backbone.js](https://backbonejs.org/)** - Built-in WordPress client

### Learning Resources

- **[REST API Handbook](https://developer.wordpress.org/rest-api/)** - Official guide
- **[WP REST API FAQ](https://developer.wordpress.org/rest-api/frequently-asked-questions/)** - Common questions
- **[WordPress TV](https://wordpress.tv/?s=REST+API)** - Video tutorials

### Security

- **[REST API Authentication](https://developer.wordpress.org/rest-api/using-the-rest-api/authentication/)** - Security guide
- **[Application Passwords](https://make.wordpress.org/core/2020/11/05/application-passwords-integration-guide/)** - Authentication method
- **[REST API Security Best Practices](https://developer.wordpress.org/rest-api/)** - Security guidelines

---

## Detailed Learning Content

Below you'll find detailed explanations and code examples for working with the WordPress REST API.

## What is REST API?

The WordPress REST API provides an interface for applications to interact with your WordPress site by sending and receiving data as JSON objects. It allows you to access WordPress data from outside WordPress, making it possible to build decoupled applications.

### Benefits of REST API

- **Decoupled Architecture** - Separate frontend from backend
- **Mobile Applications** - Build native mobile apps
- **Single Page Applications** - Create SPAs with React, Vue, etc.
- **Integration** - Connect with external services
- **Flexibility** - Use any programming language
- **Modern Development** - Build with modern JavaScript frameworks

## REST API Basics

### API Endpoint Structure

```
https://example.com/wp-json/wp/v2/{endpoint}
```

**Components:**

- `wp-json` - REST API base
- `wp/v2` - Namespace and version
- `{endpoint}` - Resource (posts, pages, users, etc.)

### Core Endpoints

```
/wp/v2/posts              # Posts
/wp/v2/pages              # Pages
/wp/v2/categories         # Categories
/wp/v2/tags               # Tags
/wp/v2/users              # Users
/wp/v2/comments           # Comments
/wp/v2/media              # Media
/wp/v2/taxonomies         # Taxonomies
/wp/v2/types              # Post types
/wp/v2/statuses           # Post statuses
```

## Making API Requests

### GET Requests (Retrieve Data)

#### Retrieve All Posts

```bash
# cURL
curl https://example.com/wp-json/wp/v2/posts

# With parameters
curl "https://example.com/wp-json/wp/v2/posts?per_page=5&orderby=date&order=desc"
```

```javascript
// JavaScript (Fetch API)
fetch('https://example.com/wp-json/wp/v2/posts')
  .then(response => response.json())
  .then(data => {
    console.log(data);
  })
  .catch(error => console.error('Error:', error));

// With async/await
async function getPosts() {
  try {
    const response = await fetch('https://example.com/wp-json/wp/v2/posts?per_page=10');
    const posts = await response.json();
    return posts;
  } catch (error) {
    console.error('Error fetching posts:', error);
  }
}
```

```php
// WordPress (wp_remote_get)
$response = wp_remote_get('https://example.com/wp-json/wp/v2/posts');

if (is_wp_error($response)) {
    $error_message = $response->get_error_message();
    echo "Error: $error_message";
} else {
    $body = wp_remote_retrieve_body($response);
    $posts = json_decode($body);
    
    foreach ($posts as $post) {
        echo $post->title->rendered;
    }
}
```

#### Retrieve Single Post

```bash
# By ID
curl https://example.com/wp-json/wp/v2/posts/123

# By slug
curl "https://example.com/wp-json/wp/v2/posts?slug=hello-world"
```

```javascript
// JavaScript
async function getPost(postId) {
  const response = await fetch(`https://example.com/wp-json/wp/v2/posts/${postId}`);
  const post = await response.json();
  return post;
}
```

### POST Requests (Create Data)

#### Create a Post

```bash
# cURL with authentication
curl -X POST https://example.com/wp-json/wp/v2/posts \
  -H "Authorization: Bearer YOUR_TOKEN_HERE" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "My New Post",
    "content": "This is the post content.",
    "status": "publish"
  }'
```

```javascript
// JavaScript with authentication
async function createPost(title, content) {
  const response = await fetch('https://example.com/wp-json/wp/v2/posts', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + authToken
    },
    body: JSON.stringify({
      title: title,
      content: content,
      status: 'publish'
    })
  });
  
  const newPost = await response.json();
  return newPost;
}
```

### PUT/PATCH Requests (Update Data)

```bash
# Update post
curl -X POST https://example.com/wp-json/wp/v2/posts/123 \
  -H "Authorization: Bearer YOUR_TOKEN_HERE" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Updated Title"
  }'
```

```javascript
// JavaScript
async function updatePost(postId, updates) {
  const response = await fetch(`https://example.com/wp-json/wp/v2/posts/${postId}`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + authToken
    },
    body: JSON.stringify(updates)
  });
  
  return await response.json();
}
```

### DELETE Requests (Delete Data)

```bash
# Delete post (move to trash)
curl -X DELETE https://example.com/wp-json/wp/v2/posts/123 \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"

# Force delete (permanent)
curl -X DELETE "https://example.com/wp-json/wp/v2/posts/123?force=true" \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

```javascript
// JavaScript
async function deletePost(postId, force = false) {
  const url = `https://example.com/wp-json/wp/v2/posts/${postId}${force ? '?force=true' : ''}`;
  
  const response = await fetch(url, {
    method: 'DELETE',
    headers: {
      'Authorization': 'Bearer ' + authToken
    }
  });
  
  return await response.json();
}
```

## Query Parameters

### Common Parameters

```
?per_page=10          # Number of items per page (default: 10, max: 100)
?page=2               # Page number
?search=keyword       # Search posts
?orderby=date         # Order by (date, id, title, slug, etc.)
?order=desc           # Order direction (asc, desc)
?status=publish       # Post status
?categories=5,6       # Filter by categories
?tags=10,11           # Filter by tags
?author=1             # Filter by author
?before=2023-12-31    # Posts before date
?after=2023-01-01     # Posts after date
?slug=post-slug       # Filter by slug
?include=1,2,3        # Include specific IDs
?exclude=4,5,6        # Exclude specific IDs
```

### Example Queries

```javascript
// Get 20 published posts
fetch('https://example.com/wp-json/wp/v2/posts?per_page=20&status=publish')

// Search posts
fetch('https://example.com/wp-json/wp/v2/posts?search=wordpress')

// Get posts from specific category
fetch('https://example.com/wp-json/wp/v2/posts?categories=5')

// Get recent posts
fetch('https://example.com/wp-json/wp/v2/posts?orderby=date&order=desc&per_page=5')

// Get posts with embedded data
fetch('https://example.com/wp-json/wp/v2/posts?_embed')
```

## Authentication

### Authentication Methods

#### 1. Application Passwords (Recommended)

WordPress 5.6+ supports application passwords for REST API authentication.

**Generate Application Password:**

1. Go to Users → Profile
2. Scroll to "Application Passwords"
3. Enter name and click "Add New Application Password"
4. Copy the generated password

**Use with Basic Auth:**

```javascript
const username = 'your_username';
const appPassword = 'xxxx xxxx xxxx xxxx xxxx xxxx';
const credentials = btoa(`${username}:${appPassword}`);

fetch('https://example.com/wp-json/wp/v2/posts', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Basic ' + credentials
  },
  body: JSON.stringify({
    title: 'New Post',
    content: 'Post content',
    status: 'publish'
  })
})
.then(response => response.json())
.then(data => console.log(data));
```

#### 2. OAuth Authentication

For third-party applications, use OAuth 1.0a or OAuth 2.0.

**Install OAuth plugin:**
```bash
wp plugin install rest-api-oauth1 --activate
# or
wp plugin install wp-oauth-server --activate
```

#### 3. Cookie Authentication

For requests from the same domain (e.g., JavaScript in your theme):

```javascript
// Add nonce to requests
fetch('https://example.com/wp-json/wp/v2/posts', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'X-WP-Nonce': wpApiSettings.nonce  // WordPress provides this
  },
  body: JSON.stringify({
    title: 'New Post',
    content: 'Post content',
    status: 'publish'
  })
})
```

**Localize nonce in theme:**

```php
function mytheme_enqueue_scripts() {
  wp_enqueue_script('my-script', get_template_directory_uri() . '/js/script.js', array(), '1.0', true);
  
  wp_localize_script('my-script', 'wpApiSettings', array(
    'root' => esc_url_raw(rest_url()),
    'nonce' => wp_create_nonce('wp_rest')
  ));
}
add_action('wp_enqueue_scripts', 'mytheme_enqueue_scripts');
```

## Creating Custom REST API Endpoints

### Basic Custom Endpoint

```php
/**
 * Register custom REST API endpoint.
 */
function myplugin_register_api_endpoints() {
  register_rest_route('myplugin/v1', '/data', array(
    'methods'             => 'GET',
    'callback'            => 'myplugin_get_data',
    'permission_callback' => '__return_true', // Allow public access
  ));
}
add_action('rest_api_init', 'myplugin_register_api_endpoints');

/**
 * Endpoint callback.
 */
function myplugin_get_data($request) {
  $data = array(
    'message' => 'Hello from custom endpoint!',
    'timestamp' => time(),
  );
  
  return new WP_REST_Response($data, 200);
}
```

**Access endpoint:**
```
GET https://example.com/wp-json/myplugin/v1/data
```

### Endpoint with Parameters

```php
/**
 * Register endpoint with parameters.
 */
function myplugin_register_user_endpoint() {
  register_rest_route('myplugin/v1', '/user/(?P<id>\d+)', array(
    'methods'             => 'GET',
    'callback'            => 'myplugin_get_user_data',
    'permission_callback' => '__return_true',
    'args'                => array(
      'id' => array(
        'validate_callback' => function($param, $request, $key) {
          return is_numeric($param);
        }
      ),
    ),
  ));
}
add_action('rest_api_init', 'myplugin_register_user_endpoint');

/**
 * Get user data.
 */
function myplugin_get_user_data($request) {
  $user_id = $request['id'];
  $user = get_user_by('id', $user_id);
  
  if (!$user) {
    return new WP_Error('user_not_found', 'User not found', array('status' => 404));
  }
  
  $data = array(
    'id'    => $user->ID,
    'name'  => $user->display_name,
    'email' => $user->user_email,
  );
  
  return new WP_REST_Response($data, 200);
}
```

**Access endpoint:**
```
GET https://example.com/wp-json/myplugin/v1/user/123
```

### POST Endpoint with Authentication

```php
/**
 * Register POST endpoint.
 */
function myplugin_register_post_endpoint() {
  register_rest_route('myplugin/v1', '/submit', array(
    'methods'             => 'POST',
    'callback'            => 'myplugin_handle_submission',
    'permission_callback' => function() {
      return current_user_can('edit_posts');
    },
    'args'                => array(
      'title' => array(
        'required' => true,
        'type'     => 'string',
        'sanitize_callback' => 'sanitize_text_field',
      ),
      'content' => array(
        'required' => true,
        'type'     => 'string',
        'sanitize_callback' => 'sanitize_textarea_field',
      ),
    ),
  ));
}
add_action('rest_api_init', 'myplugin_register_post_endpoint');

/**
 * Handle submission.
 */
function myplugin_handle_submission($request) {
  $title = $request->get_param('title');
  $content = $request->get_param('content');
  
  // Create post
  $post_id = wp_insert_post(array(
    'post_title'   => $title,
    'post_content' => $content,
    'post_status'  => 'publish',
    'post_type'    => 'post',
  ));
  
  if (is_wp_error($post_id)) {
    return new WP_Error('post_creation_failed', $post_id->get_error_message(), array('status' => 500));
  }
  
  return new WP_REST_Response(array(
    'id'      => $post_id,
    'message' => 'Post created successfully',
  ), 201);
}
```

### Complete CRUD Endpoint

```php
/**
 * Register CRUD endpoints.
 */
function myplugin_register_crud_endpoints() {
  $namespace = 'myplugin/v1';
  $base = 'items';
  
  // GET all items
  register_rest_route($namespace, '/' . $base, array(
    'methods'             => 'GET',
    'callback'            => 'myplugin_get_items',
    'permission_callback' => '__return_true',
  ));
  
  // GET single item
  register_rest_route($namespace, '/' . $base . '/(?P<id>\d+)', array(
    'methods'             => 'GET',
    'callback'            => 'myplugin_get_item',
    'permission_callback' => '__return_true',
  ));
  
  // POST create item
  register_rest_route($namespace, '/' . $base, array(
    'methods'             => 'POST',
    'callback'            => 'myplugin_create_item',
    'permission_callback' => function() {
      return current_user_can('edit_posts');
    },
  ));
  
  // PUT/POST update item
  register_rest_route($namespace, '/' . $base . '/(?P<id>\d+)', array(
    'methods'             => array('POST', 'PUT', 'PATCH'),
    'callback'            => 'myplugin_update_item',
    'permission_callback' => function() {
      return current_user_can('edit_posts');
    },
  ));
  
  // DELETE item
  register_rest_route($namespace, '/' . $base . '/(?P<id>\d+)', array(
    'methods'             => 'DELETE',
    'callback'            => 'myplugin_delete_item',
    'permission_callback' => function() {
      return current_user_can('delete_posts');
    },
  ));
}
add_action('rest_api_init', 'myplugin_register_crud_endpoints');
```

## Custom Post Type REST API Support

### Enable REST API for Custom Post Type

```php
/**
 * Register custom post type with REST API support.
 */
function myplugin_register_book_post_type() {
  register_post_type('book', array(
    'labels'       => array(
      'name' => 'Books',
      'singular_name' => 'Book',
    ),
    'public'       => true,
    'show_in_rest' => true,  // Enable REST API
    'rest_base'    => 'books',  // Custom endpoint name
    'rest_controller_class' => 'WP_REST_Posts_Controller',
  ));
}
add_action('init', 'myplugin_register_book_post_type');
```

**Access custom post type:**
```
GET https://example.com/wp-json/wp/v2/books
```

### Add Custom Fields to REST API

```php
/**
 * Add custom field to REST API response.
 */
function myplugin_register_custom_fields() {
  register_rest_field('post', 'custom_field', array(
    'get_callback'    => 'myplugin_get_custom_field',
    'update_callback' => 'myplugin_update_custom_field',
    'schema'          => array(
      'description' => 'Custom field data',
      'type'        => 'string',
      'context'     => array('view', 'edit'),
    ),
  ));
}
add_action('rest_api_init', 'myplugin_register_custom_fields');

/**
 * Get custom field value.
 */
function myplugin_get_custom_field($object, $field_name, $request) {
  return get_post_meta($object['id'], '_custom_field', true);
}

/**
 * Update custom field value.
 */
function myplugin_update_custom_field($value, $object, $field_name) {
  if (!$value || !is_string($value)) {
    return;
  }
  
  return update_post_meta($object->ID, '_custom_field', sanitize_text_field($value));
}
```

## Practical Example: Building a React Frontend

### Display Posts with React

```javascript
import React, { useState, useEffect } from 'react';

function BlogPosts() {
  const [posts, setPosts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  
  useEffect(() => {
    fetch('https://example.com/wp-json/wp/v2/posts?_embed')
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(data => {
        setPosts(data);
        setLoading(false);
      })
      .catch(error => {
        setError(error.message);
        setLoading(false);
      });
  }, []);
  
  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error}</div>;
  
  return (
    <div className="blog-posts">
      <h1>Blog Posts</h1>
      {posts.map(post => (
        <article key={post.id}>
          <h2 dangerouslySetInnerHTML={{ __html: post.title.rendered }} />
          {post._embedded && post._embedded['wp:featuredmedia'] && (
            <img 
              src={post._embedded['wp:featuredmedia'][0].source_url} 
              alt={post.title.rendered}
            />
          )}
          <div dangerouslySetInnerHTML={{ __html: post.excerpt.rendered }} />
          <a href={post.link}>Read More</a>
        </article>
      ))}
    </div>
  );
}

export default BlogPosts;
```

## Practical Exercises

### Exercise 1: Fetch and Display Posts

Create a simple HTML page that fetches and displays posts from your WordPress site using vanilla JavaScript.

### Exercise 2: Custom Endpoint

Create a custom REST API endpoint that returns:
- Total number of posts
- Total number of pages
- Total number of users
- Site statistics

### Exercise 3: Protected Endpoint

Create a protected endpoint that requires authentication and allows users to submit contact form data.

### Exercise 4: React Application

Build a simple React application that:
- Displays a list of posts
- Shows single post view
- Implements search functionality
- Handles pagination

## Key Takeaways

1. **REST API enables decoupled architecture**
2. **Authentication is crucial** for write operations
3. **Use query parameters** for filtering data
4. **Custom endpoints extend functionality**
5. **Enable REST API support** for custom post types
6. **Validate and sanitize** all inputs
7. **Handle errors properly** with WP_Error
8. **Use proper HTTP status codes**
9. **Document your custom endpoints**
10. **Test API endpoints thoroughly**

## Next Steps

Continue with [WP-CLI](07-wp-cli.md) to learn command-line WordPress management.

---

**Resources:**

- [REST API Handbook](https://developer.wordpress.org/rest-api/)
- [REST API Reference](https://developer.wordpress.org/rest-api/reference/)
- [WordPress REST API Authentication](https://developer.wordpress.org/rest-api/using-the-rest-api/authentication/)

