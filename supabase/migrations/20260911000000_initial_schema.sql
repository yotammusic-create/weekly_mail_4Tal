create table if not exists public.items (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  source text not null check (source in ('whatsapp', 'manual')),
  whatsapp_message_id text unique,
  sender_phone text,
  message_type text not null check (message_type in ('text', 'audio', 'image', 'document', 'link')),
  original_content text not null default '',
  media_id text,
  media_url text,
  transcript text,
  transcription_status text not null default 'not_required',
  summary text,
  title text,
  topics jsonb not null default '[]'::jsonb,
  audience text,
  priority text,
  status text not null default 'inbox' check (status in ('inbox', 'selected', 'used', 'archived')),
  newsletter_id uuid
);

create table if not exists public.newsletters (
  id uuid primary key default gen_random_uuid(),
  period_start date not null,
  period_end date not null,
  title text,
  draft_markdown text,
  final_markdown text,
  status text not null default 'draft' check (status in ('draft', 'approved', 'sent', 'archived')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.items add constraint items_newsletter_id_fkey foreign key (newsletter_id) references public.newsletters(id) on delete set null;

alter table public.items enable row level security;
alter table public.newsletters enable row level security;

create policy "authenticated users manage items" on public.items for all to authenticated using (true) with check (true);
create policy "authenticated users manage newsletters" on public.newsletters for all to authenticated using (true) with check (true);

