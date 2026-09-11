import { serve } from 'https://deno.land/std@0.224.0/http/server.ts';

serve(async (request) => {
  const url = new URL(request.url);
  if (request.method === 'GET') {
    const token = url.searchParams.get('hub.verify_token');
    const challenge = url.searchParams.get('hub.challenge');
    return token === Deno.env.get('META_VERIFY_TOKEN') && challenge
      ? new Response(challenge, { status: 200 })
      : new Response('Forbidden', { status: 403 });
  }
  if (request.method !== 'POST') return new Response('Method not allowed', { status: 405 });
  // Payload validation, signature verification, database writes and async processing come next.
  return new Response('Accepted', { status: 200 });
});

