# Newsletter PWA — בסיס חיבורים

שלד ראשוני ל־PWA בעברית לאיסוף חומרים מ־WhatsApp ויצירת ניוזלטר.

## הרצה מקומית

1. העתק `.env.example` אל `.env.local` ומלא רק פרטי חיבור זמינים.
2. התקן תלויות: `npm install`
3. הרץ: `npm run dev`

## לפני חיבור השירותים

- GitHub: כתובת repository או הרשאת token בעלת גישת Contents.
- Netlify: Site ID או Deploy Hook.
- Supabase: Project ref, URL ו־Anon key. סודות נשארים ב־Supabase Edge Function Secrets.
- WhatsApp: App Secret, verify token, access token ו־Phone Number ID.

אין סודות בקבצי הפרויקט. הפונקציות עדיין שלד בלבד ואינן שומרות או שולחות הודעות.
