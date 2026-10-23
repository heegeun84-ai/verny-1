-- 2026-10-30 Supabase 정책 대응: 기존 테이블 권한을 명시화(신규 환경 재현용). 기존 DB 권한 변화 없음.
-- 이 파일은 GRANT만 추가한다.
-- events / orders 는 RLS on + 정책 없음 = 설계상 anon·authenticated 접근 차단, 서버(app/api, dash)에서 service_role 키로만 접근.
-- orders 는 개인정보(이름·연락처·주소) 포함 → anon/authenticated grant 하지 않음.

grant select, insert, update, delete on table public.events to service_role;
grant select, insert, update, delete on table public.orders to service_role;

-- identity 컬럼 시퀀스
grant usage, select on all sequences in schema public to service_role;

-- 뷰 없음
