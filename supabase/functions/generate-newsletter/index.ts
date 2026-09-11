import { serve } from 'https://deno.land/std@0.224.0/http/server.ts';

serve(() => new Response(JSON.stringify({ error: 'Newsletter generation is not configured yet.' }), {
  status: 501,
  headers: { 'content-type': 'application/json' },
}));

