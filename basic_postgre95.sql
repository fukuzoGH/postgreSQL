/*
PGSQL Backup
Source Server Version: 9.5.4
Source Database: basic
*/


-- ----------------------------
--  Sequence definition for "public"."t_顧客_顧客ID"
-- ----------------------------
DROP SEQUENCE "public"."t_顧客_顧客ID";
CREATE SEQUENCE "public"."t_顧客_顧客ID"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 11
 CACHE 1;

SELECT setval('"public"."t_顧客_顧客ID"', 11, true);;

-- ----------------------------
--  Sequence definition for "public"."t_商品_商品ID"
-- ----------------------------
DROP SEQUENCE "public"."t_商品_商品ID";
CREATE SEQUENCE "public"."t_商品_商品ID"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 7
 CACHE 1;

SELECT setval('"public"."t_商品_商品ID"', 7, true);;

-- ----------------------------
--  Sequence definition for "public"."t_売上_売上ID"
-- ----------------------------
DROP SEQUENCE "public"."t_売上_売上ID";
CREATE SEQUENCE "public"."t_売上_売上ID"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 19
 CACHE 1;

SELECT setval('"public"."t_売上_売上ID"', 19, true);;

-- ----------------------------
--  Sequence definition for "public"."t_売上_売上詳細ID"
-- ----------------------------
DROP SEQUENCE "public"."t_売上_売上詳細ID";
CREATE SEQUENCE "public"."t_売上_売上詳細ID"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 47
 CACHE 1;

SELECT setval('"public"."t_売上_売上詳細ID"', 47, true);;

-- ----------------------------
--  Sequence definition for "public"."test_id"
-- ----------------------------
DROP SEQUENCE "public"."test_id";
CREATE SEQUENCE "public"."test_id"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;;

-- ----------------------------
--  Table structure for "public"."t_test"
-- ----------------------------
DROP TABLE "public"."t_test";
CREATE TABLE "public"."t_test" (
"id" int4 NOT NULL,
"w_name" varchar(50) COLLATE "default" DEFAULT ''::character varying
)
WITH (OIDS=FALSE)
;;

-- ----------------------------
--  Table structure for "public"."t_test_cpy"
-- ----------------------------
DROP TABLE "public"."t_test_cpy";
CREATE TABLE "public"."t_test_cpy" (
"id" int4 NOT NULL,
"w_name" varchar(50) COLLATE "default" DEFAULT ''::character varying
)
WITH (OIDS=FALSE)
;;

-- ----------------------------
--  Table structure for "public"."t_test_tmp"
-- ----------------------------
DROP TABLE "public"."t_test_tmp";
CREATE TABLE "public"."t_test_tmp" (
"id" int4 NOT NULL,
"w_name" varchar(50) COLLATE "default" DEFAULT ''::character varying
)
WITH (OIDS=FALSE)
;;

-- ----------------------------
--  Table structure for "public"."t_test2"
-- ----------------------------
DROP TABLE "public"."t_test2";
CREATE TABLE "public"."t_test2" (
"id" int4 NOT NULL,
"w_name" varchar(50) COLLATE "default" DEFAULT ''::character varying
)
WITH (OIDS=FALSE)
;;

-- ----------------------------
--  Table structure for "public"."t_顧客"
-- ----------------------------
DROP TABLE "public"."t_顧客";
CREATE TABLE "public"."t_顧客" (
"顧客ID" int4 DEFAULT nextval('"t_顧客_顧客ID"'::regclass) NOT NULL,
"顧客名" varchar(50) COLLATE "default" DEFAULT ''::character varying,
PRIMARY KEY ("顧客ID")
)
WITH (OIDS=FALSE)
;;

-- ----------------------------
--  Table structure for "public"."t_顧客_カーソル"
-- ----------------------------
DROP TABLE "public"."t_顧客_カーソル";
CREATE TABLE "public"."t_顧客_カーソル" (
"顧客ID" int4 DEFAULT 0 NOT NULL,
PRIMARY KEY ("顧客ID")
)
WITH (OIDS=FALSE)
;;

-- ----------------------------
--  Table structure for "public"."t_商品"
-- ----------------------------
DROP TABLE "public"."t_商品";
CREATE TABLE "public"."t_商品" (
"商品ID" int4 DEFAULT nextval('"t_商品_商品ID"'::regclass) NOT NULL,
"商品名" varchar(50) COLLATE "default" DEFAULT ''::character varying,
"販売単価" int4 DEFAULT 0,
PRIMARY KEY ("商品ID")
)
WITH (OIDS=FALSE)
;;

-- ----------------------------
--  Table structure for "public"."t_年"
-- ----------------------------
DROP TABLE "public"."t_年";
CREATE TABLE "public"."t_年" (
"年" int4
)
WITH (OIDS=FALSE)
;;

-- ----------------------------
--  Table structure for "public"."t_売上"
-- ----------------------------
DROP TABLE "public"."t_売上";
CREATE TABLE "public"."t_売上" (
"売上id" int4 DEFAULT nextval('"t_売上_売上ID"'::regclass) NOT NULL,
"日付" date,
"売上金額" int4 DEFAULT 0,
"顧客ID" int4 DEFAULT 0,
"備考" varchar(10) COLLATE "default" DEFAULT ''::character varying,
PRIMARY KEY ("売上id"),
FOREIGN KEY ("顧客ID") REFERENCES "public"."t_顧客" ("顧客ID") ON DELETE CASCADE ON UPDATE CASCADE
)
WITH (OIDS=FALSE)
;;

-- ----------------------------
--  Table structure for "public"."t_売上月"
-- ----------------------------
DROP TABLE "public"."t_売上月";
CREATE TABLE "public"."t_売上月" (
"年月" varchar(6) COLLATE "default" NOT NULL,
"金額" int4 DEFAULT 0,
PRIMARY KEY ("年月")
)
WITH (OIDS=FALSE)
;;

-- ----------------------------
--  Table structure for "public"."t_売上詳細"
-- ----------------------------
DROP TABLE "public"."t_売上詳細";
CREATE TABLE "public"."t_売上詳細" (
"売上詳細ID" int4 DEFAULT nextval('"t_売上_売上詳細ID"'::regclass) NOT NULL,
"商品id" int4 DEFAULT 0,
"数量" int4 DEFAULT 1,
"金額" int4 DEFAULT 0,
"売上id" int4,
PRIMARY KEY ("売上詳細ID"),
FOREIGN KEY ("商品id") REFERENCES "public"."t_商品" ("商品ID") ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ("売上id") REFERENCES "public"."t_売上" ("売上id") ON DELETE CASCADE ON UPDATE CASCADE
)
WITH (OIDS=FALSE)
;;

-- ----------------------------
--  Table structure for "public"."t_曜日"
-- ----------------------------
DROP TABLE "public"."t_曜日";
CREATE TABLE "public"."t_曜日" (
"曜日" int4 NOT NULL,
"曜日文字" varchar(1) COLLATE "default" DEFAULT ''::character varying,
PRIMARY KEY ("曜日")
)
WITH (OIDS=FALSE)
;;

-- ----------------------------
--  Table structure for "public"."test"
-- ----------------------------
DROP TABLE "public"."test";
CREATE TABLE "public"."test" (
"id" int4 NOT NULL,
"c_name" varchar(255) COLLATE "default" DEFAULT ''::character varying NOT NULL,
PRIMARY KEY ("id")
)
WITH (OIDS=FALSE)
;;

-- ----------------------------
--  View definition for "public"."v_"
-- ----------------------------
DROP VIEW "public"."v_";
CREATE VIEW "public"."v_" AS
 SELECT "日付_差"() AS "差";;

-- ----------------------------
--  View definition for "public"."v_日付_current_date"
-- ----------------------------
DROP VIEW "public"."v_日付_current_date";
CREATE VIEW "public"."v_日付_current_date" AS
 SELECT "日付_システム日付"() AS "日付";;

-- ----------------------------
--  View definition for "public"."v_日付_current_timestamp"
-- ----------------------------
DROP VIEW "public"."v_日付_current_timestamp";
CREATE VIEW "public"."v_日付_current_timestamp" AS
 SELECT "日付_システム日付2"() AS "日付";;

-- ----------------------------
--  View definition for "public"."v_日付_now"
-- ----------------------------
DROP VIEW "public"."v_日付_now";
CREATE VIEW "public"."v_日付_now" AS
 SELECT "日付_システム日付3"() AS "日付";;

-- ----------------------------
--  View definition for "public"."v_日付_to_char"
-- ----------------------------
DROP VIEW "public"."v_日付_to_char";
CREATE VIEW "public"."v_日付_to_char" AS
 SELECT "日付_to_char"() AS a;;

-- ----------------------------
--  View definition for "public"."v_日付_加算"
-- ----------------------------
DROP VIEW "public"."v_日付_加算";
CREATE VIEW "public"."v_日付_加算" AS
 SELECT "日付_加算_日"() AS "加算_日";;

-- ----------------------------
--  View definition for "public"."v_日付_曜日"
-- ----------------------------
DROP VIEW "public"."v_日付_曜日";
CREATE VIEW "public"."v_日付_曜日" AS
 SELECT "日付_加算_曜日"() AS "曜日",
    ( SELECT "t_曜日"."曜日文字"
           FROM "t_曜日"
          WHERE ("t_曜日"."曜日" = "日付_加算_曜日"())) AS "曜日文字";;

-- ----------------------------
--  View definition for "public"."v_年"
-- ----------------------------
DROP VIEW "public"."v_年";
CREATE VIEW "public"."v_年" AS
 SELECT "t_年"."年"
   FROM "t_年"
  ORDER BY "t_年"."年" DESC;;

-- ----------------------------
--  View definition for "public"."v_売上"
-- ----------------------------
DROP VIEW "public"."v_売上";
CREATE VIEW "public"."v_売上" AS
 SELECT "t_売上"."売上id",
    "t_売上"."日付",
    "t_売上"."顧客ID",
    "t_顧客"."顧客名",
    "t_売上"."売上金額",
    "t_売上詳細"."売上詳細ID",
    "t_売上詳細"."商品id",
    "t_売上詳細"."数量",
    "t_売上詳細"."金額",
    "t_商品"."商品名",
    "t_商品"."販売単価"
   FROM ((("t_売上"
     JOIN "t_顧客" ON (("t_売上"."顧客ID" = "t_顧客"."顧客ID")))
     JOIN "t_売上詳細" ON (("t_売上"."売上id" = "t_売上詳細"."売上id")))
     JOIN "t_商品" ON (("t_売上詳細"."商品id" = "t_売上詳細"."売上id")))
  ORDER BY "t_売上"."日付" DESC;;

-- ----------------------------
--  Procedure definition for "public"."_はじめに"()
-- ----------------------------
DROP FUNCTION "public"."_はじめに"();
DELIMITER ;;
CREATE FUNCTION "public"."_はじめに"()
  RETURNS "pg_catalog"."varchar" AS $BODY$BEGIN
--
-- 特徴など
--

-- [注意]
--
-- PL/pgSQL は、Oracle の PL/SQL と違い、
-- ストアドファンクションとしてのみ使用可能
--

-- [トランザクションについて]
--
-- PL/pgSQL 内ではトランザクションコマンドは使えない。
-- ADO - ODBC や JDBC でのトランザクション配下から、呼ばれた
-- ストアドやトリガーは、ちゃんとロールバック可能


--[基本的にどうやって書くか]
--
--　create function 関数名(引数, ...) returns 戻り値型 as
--　declare
--　　　定数 constant 型 := 定数値
--　　　変数 alias for $1; -- 引数の別名宣言
--　　　変数 型 := 初期値
--    変数 型 defalut 省略値
--    変数 テーブル%rowtype;
--    変数 テーブル.フィールド%type;
--    変数 record;
--    rename 変数名 to 新変数名;
--    一般宣言;
--  begin
--    perform 呼び出し関数(引数, ...);  -- 関数呼び出し
--    一般構文;
--    return 戻り値;
--  end;
--  language 'plpgsql';

RETURN '';

END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."a"()
-- ----------------------------
DROP FUNCTION "public"."a"();
DELIMITER ;;
CREATE FUNCTION "public"."a"()
  RETURNS "pg_catalog"."int4" AS $BODY$BEGIN

SELECT DISTINCT
"マンスリーメンバーコース一覧"."コースNo",
"マンスリーメンバーコース一覧"."コース名",
(SELECT count(*) FROM "会員マスタ" WHERE "マンスリーメンバーコース一覧"."コースNo" = "会員マスタ"."コースNo" and ("会員マスタ"."マンスリーメンバー" = 1 or "会員マスタ"."ゴールドメンバー" = 1) AND "会員マスタ"."住所" LIKE '%岐阜%' ) AS KenNaiTotal,
 "Total"-"KenNaiTotal" AS KenGaiTotal,
(SELECT count(*) FROM "会員マスタ" WHERE "マンスリーメンバーコース一覧"."コースNo" = "会員マスタ"."コースNo" and ("会員マスタ"."マンスリーメンバー" = 1 or "会員マスタ"."ゴールドメンバー" = 1) ) AS Total,
(SELECT count(*) FROM "会員マスタ" WHERE "マンスリーメンバーコース一覧"."コースNo" = "会員マスタ"."コースNo" and("会員マスタ"."マンスリーメンバー" = 1 or "会員マスタ"."ゴールドメンバー" = 1) AND "会員マスタ"."追加書類" Like '%▲%' ) AS Syorui,
(SELECT count(*) FROM "会員マスタ" WHERE "マンスリーメンバーコース一覧"."コースNo" = "会員マスタ"."コースNo" and("会員マスタ"."マンスリーメンバー" = 1 or "会員マスタ"."ゴールドメンバー" = 1) AND "会員マスタ"."住所" LIKE '%岐阜%' AND "会員マスタ"."追加書類" Like '%▲%' ) AS SyoruiKen,
(SELECT count(*) FROM "会員マスタ" WHERE "マンスリーメンバーコース一覧"."コースNo" = "会員マスタ"."コースNo" and("会員マスタ"."マンスリーメンバー" = 1 or "会員マスタ"."ゴールドメンバー" = 1) and "会員マスタ"."追加書類" Like '%★%' ) AS Hiki,
(SELECT count(*) FROM "会員マスタ" WHERE "マンスリーメンバーコース一覧"."コースNo" = "会員マスタ"."コースNo" and("会員マスタ"."マンスリーメンバー" = 1 or "会員マスタ"."ゴールドメンバー" = 1) AND "会員マスタ"."住所" LIKE '%岐阜%' and "会員マスタ"."追加書類" Like '%★%' ) AS HikiKen,
("Syorui"+"Hiki") AS HassouFukaTotal,
("Total"-"HassouFukaTotal") AS HassouTotal,
'' AS TKenNai,
'' AS TKenGai
FROM マンスリーメンバーコース一覧;




RETURN 0;


END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."func1"()
-- ----------------------------
DROP FUNCTION "public"."func1"();
DELIMITER ;;
CREATE FUNCTION "public"."func1"()
  RETURNS SETOF "public"."t_売上" AS $BODY$
SELECT * FROM t_売上;
$BODY$
  LANGUAGE 'sql' VOLATILE COST 100
 ROWS 1000
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."good_sample1"()
-- ----------------------------
DROP FUNCTION "public"."good_sample1"();
DELIMITER ;;
CREATE FUNCTION "public"."good_sample1"()
  RETURNS SETOF "pg_catalog"."varchar" AS $BODY$
DECLARE
BEGIN
	RETURN QUERY SELECT "商品名" FROM "t_商品";
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
 ROWS 1000
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_abort_target"("session" int4)
-- ----------------------------
DROP FUNCTION "public"."pldbg_abort_target"("session" int4);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_abort_target"("session" int4)
  RETURNS SETOF "pg_catalog"."bool" AS '$libdir/plugin_debugger', 'pldbg_abort_target'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
 ROWS 1000
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_attach_to_port"("portnumber" int4)
-- ----------------------------
DROP FUNCTION "public"."pldbg_attach_to_port"("portnumber" int4);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_attach_to_port"("portnumber" int4)
  RETURNS "pg_catalog"."int4" AS '$libdir/plugin_debugger', 'pldbg_attach_to_port'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_continue"("session" int4)
-- ----------------------------
DROP FUNCTION "public"."pldbg_continue"("session" int4);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_continue"("session" int4)
  RETURNS "public"."breakpoint" AS '$libdir/plugin_debugger', 'pldbg_continue'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_create_listener"()
-- ----------------------------
DROP FUNCTION "public"."pldbg_create_listener"();
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_create_listener"()
  RETURNS "pg_catalog"."int4" AS '$libdir/plugin_debugger', 'pldbg_create_listener'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_deposit_value"("session" int4, "varname" text, "linenumber" int4, "value" text)
-- ----------------------------
DROP FUNCTION "public"."pldbg_deposit_value"("session" int4, "varname" text, "linenumber" int4, "value" text);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_deposit_value"("session" int4, "varname" text, "linenumber" int4, "value" text)
  RETURNS "pg_catalog"."bool" AS '$libdir/plugin_debugger', 'pldbg_deposit_value'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_drop_breakpoint"("session" int4, "func" oid, "linenumber" int4)
-- ----------------------------
DROP FUNCTION "public"."pldbg_drop_breakpoint"("session" int4, "func" oid, "linenumber" int4);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_drop_breakpoint"("session" int4, "func" oid, "linenumber" int4)
  RETURNS "pg_catalog"."bool" AS '$libdir/plugin_debugger', 'pldbg_drop_breakpoint'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_get_breakpoints"("session" int4)
-- ----------------------------
DROP FUNCTION "public"."pldbg_get_breakpoints"("session" int4);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_get_breakpoints"("session" int4)
  RETURNS SETOF "public"."breakpoint" AS '$libdir/plugin_debugger', 'pldbg_get_breakpoints'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
 ROWS 1000
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_get_proxy_info"()
-- ----------------------------
DROP FUNCTION "public"."pldbg_get_proxy_info"();
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_get_proxy_info"()
  RETURNS "public"."proxyinfo" AS '$libdir/plugin_debugger', 'pldbg_get_proxy_info'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_get_source"("session" int4, "func" oid)
-- ----------------------------
DROP FUNCTION "public"."pldbg_get_source"("session" int4, "func" oid);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_get_source"("session" int4, "func" oid)
  RETURNS "pg_catalog"."text" AS '$libdir/plugin_debugger', 'pldbg_get_source'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_get_stack"("session" int4)
-- ----------------------------
DROP FUNCTION "public"."pldbg_get_stack"("session" int4);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_get_stack"("session" int4)
  RETURNS SETOF "public"."frame" AS '$libdir/plugin_debugger', 'pldbg_get_stack'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
 ROWS 1000
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_get_target_info"("signature" text, "targettype" char)
-- ----------------------------
DROP FUNCTION "public"."pldbg_get_target_info"("signature" text, "targettype" char);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_get_target_info"("signature" text, "targettype" char)
  RETURNS "public"."targetinfo" AS $BODY$
  SELECT p.oid AS target,
         pronamespace AS schema,
         pronargs::int4 AS nargs,
         -- The returned argtypes column is of type oidvector, but unlike
         -- proargtypes, it's supposed to include OUT params. So we
         -- essentially have to return proallargtypes, converted to an
         -- oidvector. There is no oid[] -> oidvector cast, so we have to
         -- do it via text.
         CASE WHEN proallargtypes IS NOT NULL THEN
           translate(proallargtypes::text, ',{}', ' ')::oidvector
         ELSE
           proargtypes
         END AS argtypes,
         proname AS targetname,
         proargmodes AS argmodes,
         proargnames AS proargnames,
         prolang AS targetlang,
         quote_ident(nspname) || '.' || quote_ident(proname) AS fqname,
         proretset AS returnsset,
         prorettype AS returntype,

         't'::bool AS isfunc,
         0::oid AS pkg,
	 NULL::text[] AS argdefvals

  FROM pg_proc p, pg_namespace n
  WHERE p.pronamespace = n.oid
  AND p.oid = $1::oid
  -- We used to support querying by function name or trigger name/oid as well,
  -- but that was never used in the client, so the support for that has been
  -- removed. The targeType argument remains as a legacy of that. You're
  -- expected to pass 'o' as target type, but it doesn't do anything.
  AND $2 = 'o'
$BODY$
  LANGUAGE 'sql' VOLATILE COST 100
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_get_variables"("session" int4)
-- ----------------------------
DROP FUNCTION "public"."pldbg_get_variables"("session" int4);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_get_variables"("session" int4)
  RETURNS SETOF "public"."var" AS '$libdir/plugin_debugger', 'pldbg_get_variables'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
 ROWS 1000
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_oid_debug"("functionoid" oid)
-- ----------------------------
DROP FUNCTION "public"."pldbg_oid_debug"("functionoid" oid);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_oid_debug"("functionoid" oid)
  RETURNS "pg_catalog"."int4" AS '$libdir/plugin_debugger', 'pldbg_oid_debug'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_select_frame"("session" int4, "frame" int4)
-- ----------------------------
DROP FUNCTION "public"."pldbg_select_frame"("session" int4, "frame" int4);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_select_frame"("session" int4, "frame" int4)
  RETURNS "public"."breakpoint" AS '$libdir/plugin_debugger', 'pldbg_select_frame'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_set_breakpoint"("session" int4, "func" oid, "linenumber" int4)
-- ----------------------------
DROP FUNCTION "public"."pldbg_set_breakpoint"("session" int4, "func" oid, "linenumber" int4);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_set_breakpoint"("session" int4, "func" oid, "linenumber" int4)
  RETURNS "pg_catalog"."bool" AS '$libdir/plugin_debugger', 'pldbg_set_breakpoint'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_set_global_breakpoint"("session" int4, "func" oid, "linenumber" int4, "targetpid" int4)
-- ----------------------------
DROP FUNCTION "public"."pldbg_set_global_breakpoint"("session" int4, "func" oid, "linenumber" int4, "targetpid" int4);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_set_global_breakpoint"("session" int4, "func" oid, "linenumber" int4, "targetpid" int4)
  RETURNS "pg_catalog"."bool" AS '$libdir/plugin_debugger', 'pldbg_set_global_breakpoint'
  LANGUAGE 'c' VOLATILE COST 1
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_step_into"("session" int4)
-- ----------------------------
DROP FUNCTION "public"."pldbg_step_into"("session" int4);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_step_into"("session" int4)
  RETURNS "public"."breakpoint" AS '$libdir/plugin_debugger', 'pldbg_step_into'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_step_over"("session" int4)
-- ----------------------------
DROP FUNCTION "public"."pldbg_step_over"("session" int4);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_step_over"("session" int4)
  RETURNS "public"."breakpoint" AS '$libdir/plugin_debugger', 'pldbg_step_over'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_wait_for_breakpoint"("session" int4)
-- ----------------------------
DROP FUNCTION "public"."pldbg_wait_for_breakpoint"("session" int4);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_wait_for_breakpoint"("session" int4)
  RETURNS "public"."breakpoint" AS '$libdir/plugin_debugger', 'pldbg_wait_for_breakpoint'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."pldbg_wait_for_target"("session" int4)
-- ----------------------------
DROP FUNCTION "public"."pldbg_wait_for_target"("session" int4);
DELIMITER ;;
CREATE FUNCTION "public"."pldbg_wait_for_target"("session" int4)
  RETURNS "pg_catalog"."int4" AS '$libdir/plugin_debugger', 'pldbg_wait_for_target'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."plpgsql_oid_debug"("functionoid" oid)
-- ----------------------------
DROP FUNCTION "public"."plpgsql_oid_debug"("functionoid" oid);
DELIMITER ;;
CREATE FUNCTION "public"."plpgsql_oid_debug"("functionoid" oid)
  RETURNS "pg_catalog"."int4" AS $BODY$ SELECT pldbg_oid_debug($1) $BODY$
  LANGUAGE 'sql' VOLATILE STRICT  COST 100
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."sp_version"()
-- ----------------------------
DROP FUNCTION "public"."sp_version"();
DELIMITER ;;
CREATE FUNCTION "public"."sp_version"()
  RETURNS "pg_catalog"."void" AS $BODY$BEGIN
	--SELECT version();
  PERFORM version();
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."test"()
-- ----------------------------
DROP FUNCTION "public"."test"();
DELIMITER ;;
CREATE FUNCTION "public"."test"()
  RETURNS "pg_catalog"."varchar" AS $BODY$DECLARE
var_date varchar(10);

BEGIN
	--5 日後
--var_date:='2001-07-12';
	var_date:=cast("業務_月初"() as varchar(10));
--'2001-07-12'
-- "業務_月初"()
	RETURN to_date(var_date, 'YYYY-MM-DD') + 5;

END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."test_int4"()
-- ----------------------------
DROP FUNCTION "public"."test_int4"();
DELIMITER ;;
CREATE FUNCTION "public"."test_int4"()
  RETURNS "pg_catalog"."int4" AS $BODY$BEGIN

	RETURN cast(substr(to_char(now(),'yyyy/mm/dd'), 1, 4) as int);
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."test_rec_001"()
-- ----------------------------
DROP FUNCTION "public"."test_rec_001"();
DELIMITER ;;
CREATE FUNCTION "public"."test_rec_001"()
  RETURNS SETOF "pg_catalog"."text" AS $BODY$BEGIN
RETURN QUERY SELECT 商品ID,商品名 FROM "t_商品";
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
 ROWS 1000
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."test_varchar"()
-- ----------------------------
DROP FUNCTION "public"."test_varchar"();
DELIMITER ;;
CREATE FUNCTION "public"."test_varchar"()
  RETURNS "pg_catalog"."varchar" AS $BODY$BEGIN

	RETURN substr(to_char(now(),'yyyy/mm/dd'), 1, 4);
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."test_varchar_param"()
-- ----------------------------
DROP FUNCTION "public"."test_varchar_param"();
DELIMITER ;;
CREATE FUNCTION "public"."test_varchar_param"()
  RETURNS "pg_catalog"."varchar" AS $BODY$BEGIN

END
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."test1"()
-- ----------------------------
DROP FUNCTION "public"."test1"();
DELIMITER ;;
CREATE FUNCTION "public"."test1"()
  RETURNS SETOF "pg_catalog"."record" AS $BODY$SELECT 売上ID,日付,売上金額 FROM t_売上;$BODY$
  LANGUAGE 'sql' VOLATILE SECURITY DEFINER  COST 100
 ROWS 1000
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."uri"()
-- ----------------------------
DROP FUNCTION "public"."uri"();
DELIMITER ;;
CREATE FUNCTION "public"."uri"()
  RETURNS SETOF "pg_catalog"."record" AS $BODY$
DECLARE


BEGIN
RETURN QUERY

SELECT "t_売上"."売上id",
    "t_売上"."日付",
    "t_売上"."顧客ID",
    "t_顧客"."顧客名",
    "t_売上"."売上金額",
    "t_売上詳細"."売上詳細ID",
    "t_売上詳細"."商品id",
    "t_売上詳細"."数量",
    "t_売上詳細"."金額",
    "t_商品"."商品名",
    "t_商品"."販売単価"
   FROM ((("t_売上"
   JOIN "t_顧客" ON (("t_売上"."顧客ID" = "t_顧客"."顧客ID")))
   JOIN "t_売上詳細" ON (("t_売上"."売上id" = "t_売上詳細"."売上id")))
   JOIN "t_商品" ON (("t_売上詳細"."商品id" = "t_売上詳細"."売上id")))
  ORDER BY "t_売上"."日付" DESC;

END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
 ROWS 1000
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."URL参考"()
-- ----------------------------
DROP FUNCTION "public"."URL参考"();
DELIMITER ;;
CREATE FUNCTION "public"."URL参考"()
  RETURNS "pg_catalog"."int4" AS $BODY$

DECLARE
BEGIN
/*

・ベスト
http://homepage2.nifty.com/sak/w_sak3/doc/sysbrd/psql_k21.htm


http://rogume.boy.jp/db/postgres-sql-%E3%82%B7%E3%83%BC%E3%82%B1%E3%83%B3%E3%82%B9%E3%81%AE%E4%BD%9C%E6%88%90%E3%83%BB%E3%83%88%E3%83%A9%E3%83%B3%E3%82%B6%E3%82%AF%E3%82%B7%E3%83%A7%E3%83%B3%E3%83%86%E3%82%B9%E3%83%88/

・トランザクション
http://www.cgis.biz/others/postgresql/17/

・並
http://www.jade.dti.ne.jp/kamada/index.htm


*/

    RETURN 0;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."URL参考"() IS '参考URL';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."カーソル_001"()
-- ----------------------------
DROP FUNCTION "public"."カーソル_001"();
DELIMITER ;;
CREATE FUNCTION "public"."カーソル_001"()
  RETURNS "pg_catalog"."int4" AS $BODY$DECLARE
  rec RECORD;
BEGIN
	DELETE FROM "t_顧客_カーソル";

  FOR rec IN SELECT * FROM "t_顧客" LOOP
    INSERT INTO "t_顧客_カーソル"("顧客ID") VALUES (rec."顧客ID");
  END LOOP;

  RETURN 0;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."コメント"()
-- ----------------------------
DROP FUNCTION "public"."コメント"();
DELIMITER ;;
CREATE FUNCTION "public"."コメント"()
  RETURNS "pg_catalog"."int4" AS $BODY$

DECLARE
BEGIN

--
--コメント
--

/*
コメント
*/



    RETURN 123;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."コメント"() IS 'コメント';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."シーケンス_カウントアップ"()
-- ----------------------------
DROP FUNCTION "public"."シーケンス_カウントアップ"();
DELIMITER ;;
CREATE FUNCTION "public"."シーケンス_カウントアップ"()
  RETURNS "pg_catalog"."int8" AS $BODY$--- シーケンス

BEGIN
	RETURN nextval('"t_商品_商品ID"'::regclass);
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."シーケンス_確認"()
-- ----------------------------
DROP FUNCTION "public"."シーケンス_確認"();
DELIMITER ;;
CREATE FUNCTION "public"."シーケンス_確認"()
  RETURNS "pg_catalog"."int4" AS $BODY$--シーケンス 確認

BEGIN
	RETURN currval('"t_商品_商品ID"');
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."データ型_一覧"()
-- ----------------------------
DROP FUNCTION "public"."データ型_一覧"();
DELIMITER ;;
CREATE FUNCTION "public"."データ型_一覧"()
  RETURNS "pg_catalog"."bool" AS $BODY$BEGIN
/*

--------------------------------------
数値データ型
--------------------------------------




--------------------------------------
文字データ型
--------------------------------------

--------------------------------------
日付/時刻データ型
--------------------------------------


--------------------------------------
ブーリアン型
--------------------------------------

--------------------------------------
幾何データ型
--------------------------------------

--------------------------------------
ネットワークアドレスデータ型
--------------------------------------


--------------------------------------
ビット列データ型
--------------------------------------

--------------------------------------
通貨データ型
--------------------------------------

--------------------------------------
擬似データ型
--------------------------------------


--------------------------------------
バイナリ列データ型
--------------------------------------



--------------------------------------
文字列検索型
--------------------------------------




--------------------------------------
XML型
--------------------------------------



--------------------------------------
RANGE型
--------------------------------------




*/
    RETURN TRUE;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."データ型_一覧"() IS 'データ型';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."デバッグメッセージ"()
-- ----------------------------
DROP FUNCTION "public"."デバッグメッセージ"();
DELIMITER ;;
CREATE FUNCTION "public"."デバッグメッセージ"()
  RETURNS "pg_catalog"."int4" AS $BODY$

DECLARE
BEGIN
--コメント
	--デバッグメッセージを表示
	RAISE NOTICE 'デバック出力';

	RETURN 0;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."デバッグメッセージ"() IS 'デバッグメッセージ';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."トランザクション"()
-- ----------------------------
DROP FUNCTION "public"."トランザクション"();
DELIMITER ;;
CREATE FUNCTION "public"."トランザクション"()
  RETURNS "pg_catalog"."int4" AS $BODY$
BEGIN
--BEGIN;
--BEGIN
--	UPDATE t_test SET w_name='武田' WHERE id=2；
--END
--ROLLBACK;
--
--BEGIN;
--BEGIN
--	UPDATE t_test SET w_name='上杉' WHERE id=2；
--END
--COMMIT;

END
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."基本_INSERT_INTO"()
-- ----------------------------
DROP FUNCTION "public"."基本_INSERT_INTO"();
DELIMITER ;;
CREATE FUNCTION "public"."基本_INSERT_INTO"()
  RETURNS "pg_catalog"."varchar" AS $BODY$BEGIN
/* */
	DELETE FROM t_test_cpy;

	INSERT INTO t_test_cpy(id,w_name) SELECT * FROM t_test;

	RETURN '完了!';
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."業務_今月次初"()
-- ----------------------------
DROP FUNCTION "public"."業務_今月次初"();
DELIMITER ;;
CREATE FUNCTION "public"."業務_今月次初"()
  RETURNS "pg_catalog"."date" AS $BODY$DECLARE
	var_date varchar(10);

	var_year varchar(4);
	var_month varchar(2);
	var_day varchar(2);

	int_year int;
	int_month int;
	var_date2 varchar(10);
	date_date date;

BEGIN

	var_date:=to_char(now(),'yyyy/mm/dd');

	var_year:=substr(var_date, 1, 4);   --年
	var_month:=substr(var_date, 6, 2);  --月を抽出

	int_year:=cast(var_year as int);
	int_month:=cast(var_month as int);

	if int_month<12 THEN
		int_month:=int_month+1;
	ELSE
		int_year:=int_year+1;
		int_month:=1;
	END if;

	var_month:=lpad(cast(int_month AS varchar(2)), 2, '0'); -- 0詰め
	var_year:=cast(int_year AS varchar(4));

	var_day:='01';
	var_date:=var_year || '-' || var_month|| '-' || var_day;

	date_date:=cast(var_date as date);

	RETURN date_date;
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."業務_今月次初"() IS '業務';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."業務_今月初"()
-- ----------------------------
DROP FUNCTION "public"."業務_今月初"();
DELIMITER ;;
CREATE FUNCTION "public"."業務_今月初"()
  RETURNS "pg_catalog"."date" AS $BODY$

DECLARE
	var_date varchar(10):=cast(now() AS varchar(10));
	var_date2 varchar(10);
	date_date date;

BEGIN

	var_date:=substr(var_date, 1, 8);
	var_date2:=var_date || '01';
	date_date:=cast(var_date2 AS date);

	RETURN date_date;
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."業務_今月初"() IS '業務';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."業務_今月末"()
-- ----------------------------
DROP FUNCTION "public"."業務_今月末"();
DELIMITER ;;
CREATE FUNCTION "public"."業務_今月末"()
  RETURNS "pg_catalog"."date" AS $BODY$DECLARE
	w date:=("業務_今月次初"())-1;
BEGIN
	RETURN w;
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."業務_今月末"() IS '業務';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."動的SQL001"()
-- ----------------------------
DROP FUNCTION "public"."動的SQL001"();
DELIMITER ;;
CREATE FUNCTION "public"."動的SQL001"()
  RETURNS "pg_catalog"."varchar" AS $BODY$--
DECLARE
	var_sql varchar(200);

BEGIN
	var_sql:='DELETE FROM t_test_cpy';
	execute var_sql;

	var_sql:='INSERT INTO t_test_cpy SELECT * FROM t_test';
	execute var_sql;

	RETURN var_sql;
END
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."動的SQL001"() IS '動的SQL';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."日付_to_char"()
-- ----------------------------
DROP FUNCTION "public"."日付_to_char"();
DELIMITER ;;
CREATE FUNCTION "public"."日付_to_char"()
  RETURNS "pg_catalog"."date" AS $BODY$BEGIN
/*

------------------------------------------
システム日付(サーバ日付) を返す。
------------------------------------------

current_date :
current_timestamp :
now :
*/
    RETURN to_char(current_timestamp, 'yyyy.mm.dd hh24:mi:ss');

/*
	year    年
	month   月
	day     日
	dow     曜日(0 日曜)
	hour    時
	minute  分
	second  秒
	week    週
	quarter 四半期
	oy     年間通算日(うるう年は 366 日まで)
	epoch   1970.01.01 からの通算秒
*/

END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."日付_to_char"() IS '日付';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."日付_システム日付"()
-- ----------------------------
DROP FUNCTION "public"."日付_システム日付"();
DELIMITER ;;
CREATE FUNCTION "public"."日付_システム日付"()
  RETURNS "pg_catalog"."date" AS $BODY$BEGIN
/*

------------------------------------------
システム日付(サーバ日付) を返す。
------------------------------------------

current_date :
current_timestamp :
*/
    RETURN current_date;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."日付_システム日付"() IS '日付';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."日付_システム日付2"()
-- ----------------------------
DROP FUNCTION "public"."日付_システム日付2"();
DELIMITER ;;
CREATE FUNCTION "public"."日付_システム日付2"()
  RETURNS "pg_catalog"."date" AS $BODY$BEGIN
/*

------------------------------------------
システム日付(サーバ日付) を返す。
------------------------------------------

current_date :
current_timestamp :
*/
    RETURN current_timestamp;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."日付_システム日付2"() IS '日付';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."日付_システム日付3"()
-- ----------------------------
DROP FUNCTION "public"."日付_システム日付3"();
DELIMITER ;;
CREATE FUNCTION "public"."日付_システム日付3"()
  RETURNS "pg_catalog"."date" AS $BODY$BEGIN
/*

------------------------------------------
システム日付(サーバ日付) を返す。
------------------------------------------

current_date :
current_timestamp :
now :
*/
    RETURN now();
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."日付_システム日付3"() IS '日付';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."日付_加算_月"()
-- ----------------------------
DROP FUNCTION "public"."日付_加算_月"();
DELIMITER ;;
CREATE FUNCTION "public"."日付_加算_月"()
  RETURNS "pg_catalog"."date" AS $BODY$BEGIN
--月の演算

    RETURN current_timestamp + '1 months';
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."日付_加算_月"() IS '日付';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."日付_加算_日"()
-- ----------------------------
DROP FUNCTION "public"."日付_加算_日"();
DELIMITER ;;
CREATE FUNCTION "public"."日付_加算_日"()
  RETURNS "pg_catalog"."date" AS $BODY$BEGIN
/*
add_months() は使えない

*/
    RETURN current_timestamp + '1 days';

END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."日付_加算_日"() IS '日付';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."日付_加算_曜日"()
-- ----------------------------
DROP FUNCTION "public"."日付_加算_曜日"();
DELIMITER ;;
CREATE FUNCTION "public"."日付_加算_曜日"()
  RETURNS "pg_catalog"."int4" AS $BODY$BEGIN

--次の曜日


-- 0:日
-- 1:月
-- 2:火
-- 3:水
-- 4:木
-- 5:金
-- 6：土

    RETURN date_part('dow', current_timestamp);


END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."日付_加算_曜日"() IS '日付';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."日付_差"()
-- ----------------------------
DROP FUNCTION "public"."日付_差"();
DELIMITER ;;
CREATE FUNCTION "public"."日付_差"()
  RETURNS "pg_catalog"."int4" AS $BODY$BEGIN
--
--
--
--
	RETURN current_timestamp-to_timestamp('2002.11.01 00:00:00', 'yyyy.mm.dd hh24:mi:ss');
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."日付_差"() IS '日付';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."日付_切捨"()
-- ----------------------------
DROP FUNCTION "public"."日付_切捨"();
DELIMITER ;;
CREATE FUNCTION "public"."日付_切捨"()
  RETURNS "pg_catalog"."date" AS $BODY$BEGIN
/*

------------------------------------------
日付切り捨て
------------------------------------------

date_trunc() 関数は、タイムスタンプを切り捨てる。
*/

/*
year    年
month   月
day     日
dow     曜日(0 日曜)
hour    時
minute  分
second  秒
week    週
quarter 四半期
doy     年間通算日(うるう年は 366 日まで)
epoch   1970.01.01 からの通算秒
*/
    RETURN date_trunc('hour', current_timestamp);


END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."日付_切捨"() IS '日付';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."売上"()
-- ----------------------------
DROP FUNCTION "public"."売上"();
DELIMITER ;;
CREATE FUNCTION "public"."売上"()
  RETURNS "pg_catalog"."record" AS $BODY$
BEGIN

SELECT "t_売上"."売上id",
    "t_売上"."日付",
    "t_売上"."顧客ID",
    "t_顧客"."顧客名",
    "t_売上"."売上金額",
    "t_売上詳細"."売上詳細ID",
    "t_売上詳細"."商品id",
    "t_売上詳細"."数量",
    "t_売上詳細"."金額",
    "t_商品"."商品名",
    "t_商品"."販売単価"
   FROM ((("t_売上"
   JOIN "t_顧客" ON (("t_売上"."顧客ID" = "t_顧客"."顧客ID")))
   JOIN "t_売上詳細" ON (("t_売上"."売上id" = "t_売上詳細"."売上id")))
   JOIN "t_商品" ON (("t_売上詳細"."商品id" = "t_売上詳細"."売上id")))
  ORDER BY "t_売上"."日付" DESC;

END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."文字_空白削除_右"()
-- ----------------------------
DROP FUNCTION "public"."文字_空白削除_右"();
DELIMITER ;;
CREATE FUNCTION "public"."文字_空白削除_右"()
  RETURNS "pg_catalog"."varchar" AS $BODY$


BEGIN
--右空白削除

	RETURN ltrim('abc          ');


END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."文字_空白削除_右"() IS '文字';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."文字_空白削除_左"()
-- ----------------------------
DROP FUNCTION "public"."文字_空白削除_左"();
DELIMITER ;;
CREATE FUNCTION "public"."文字_空白削除_左"()
  RETURNS "pg_catalog"."varchar" AS $BODY$


BEGIN



	RETURN ltrim('          abc');

	-- 結果 : 'abc'

END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."文字_空白削除_左"() IS '文字';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."文字_空白削除_左右"()
-- ----------------------------
DROP FUNCTION "public"."文字_空白削除_左右"();
DELIMITER ;;
CREATE FUNCTION "public"."文字_空白削除_左右"()
  RETURNS "pg_catalog"."varchar" AS $BODY$


BEGIN
-- 左右空白削除
	RETURN trim('          abc          ');
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."文字_空白削除_左右"() IS '文字';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."文字_繰り返し"()
-- ----------------------------
DROP FUNCTION "public"."文字_繰り返し"();
DELIMITER ;;
CREATE FUNCTION "public"."文字_繰り返し"()
  RETURNS "pg_catalog"."varchar" AS $BODY$


BEGIN

	RETURN repeat('abc012', 2);
	--結果 : 'abc012abc012'
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."文字_繰り返し"() IS '文字';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."文字_検索"()
-- ----------------------------
DROP FUNCTION "public"."文字_検索"();
DELIMITER ;;
CREATE FUNCTION "public"."文字_検索"()
  RETURNS "pg_catalog"."int4" AS $BODY$DECLARE


BEGIN
--
-- 文字列の検索を行う。
-- 開始位置や後方検索の指定は、PostgreSQL ではできない。
--
	RETURN strpos('abc012', 'c0');

	--結果 : 3

END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."文字_検索"() IS '文字';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."文字_小文字"()
-- ----------------------------
DROP FUNCTION "public"."文字_小文字"();
DELIMITER ;;
CREATE FUNCTION "public"."文字_小文字"()
  RETURNS "pg_catalog"."varchar" AS $BODY$


BEGIN

	RETURN lower('ABC012');
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."文字_小文字"() IS '文字';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."文字_切取"()
-- ----------------------------
DROP FUNCTION "public"."文字_切取"();
DELIMITER ;;
CREATE FUNCTION "public"."文字_切取"()
  RETURNS "pg_catalog"."varchar" AS $BODY$BEGIN
	-- 3 :開始位置
  -- 2 :切取文字数

	RETURN substr('abc012', 3, 2);

-- 結果　:  'c0'
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."文字_切取"() IS '文字';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."文字_切取2"()
-- ----------------------------
DROP FUNCTION "public"."文字_切取2"();
DELIMITER ;;
CREATE FUNCTION "public"."文字_切取2"()
  RETURNS "pg_catalog"."varchar" AS $BODY$BEGIN

	--開始位置以降、最後まで切り出す場合は、切り出す文字数を省略できる。
	RETURN substr('abc012', 3);
	-- 結果 'c012'
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."文字_切取2"() IS '文字';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."文字_大文字"()
-- ----------------------------
DROP FUNCTION "public"."文字_大文字"();
DELIMITER ;;
CREATE FUNCTION "public"."文字_大文字"()
  RETURNS "pg_catalog"."varchar" AS $BODY$

BEGIN


	RETURN upper('abc012');


END
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."文字_大文字"() IS '文字';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."文字_置換"()
-- ----------------------------
DROP FUNCTION "public"."文字_置換"();
DELIMITER ;;
CREATE FUNCTION "public"."文字_置換"()
  RETURNS "pg_catalog"."varchar" AS $BODY$

BEGIN

	--文字列の置き換えをする

	RETURN translate('abc012', '0123456789abc', '0000000000AAA');

--　結果 : 'AAA000'


END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."文字_置換"() IS '文字';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."文字_置換2"()
-- ----------------------------
DROP FUNCTION "public"."文字_置換2"();
DELIMITER ;;
CREATE FUNCTION "public"."文字_置換2"()
  RETURNS "pg_catalog"."varchar" AS $BODY$DECLARE
	ex_chr VARCHAR(30);
	from_chr VARCHAR(30);
	to_chr VARCHAR(30);

BEGIN
/*

コーテーションを置換する

*/
	ex_chr:='B''s';
	from_chr:='''';
	to_chr:='’';

--置換2
	RETURN translate(ex_chr,from_chr,to_chr);

END $BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."文字_置換2"() IS '文字';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."文字_長さ"()
-- ----------------------------
DROP FUNCTION "public"."文字_長さ"();
DELIMITER ;;
CREATE FUNCTION "public"."文字_長さ"()
  RETURNS "pg_catalog"."int4" AS $BODY$BEGIN

	RETURN length('abc012');
	-- 結果 : 6


END $BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."文字_長さ"() IS '文字';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."文字_文字変換_ascii"()
-- ----------------------------
DROP FUNCTION "public"."文字_文字変換_ascii"();
DELIMITER ;;
CREATE FUNCTION "public"."文字_文字変換_ascii"()
  RETURNS "pg_catalog"."varchar" AS $BODY$DECLARE


BEGIN
------------------
-- ascii コード変換
------------------


	RETURN ascii('A');
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."文字_文字変換_ascii"() IS '文字';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."文字_文字変換_chr"()
-- ----------------------------
DROP FUNCTION "public"."文字_文字変換_chr"();
DELIMITER ;;
CREATE FUNCTION "public"."文字_文字変換_chr"()
  RETURNS "pg_catalog"."varchar" AS $BODY$
DECLARE



BEGIN

----------------------
--
--  ASCII 文字を返す
--
----------------------
	RETURN chr(65); -- 'A' を返す
END
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."文字_文字変換_chr"() IS '文字';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."文字_文字埋_右"()
-- ----------------------------
DROP FUNCTION "public"."文字_文字埋_右"();
DELIMITER ;;
CREATE FUNCTION "public"."文字_文字埋_右"()
  RETURNS "pg_catalog"."varchar" AS $BODY$DECLARE


BEGIN

--
-- 文字列の右に指定文字を埋めて指定数切り出します。
--  (切り出し指定数になるまで繰り返し埋めます。)

	RETURN rpad('abc', 5, '012');

END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."文字_文字埋_右"() IS '文字';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."文字_文字埋_左"()
-- ----------------------------
DROP FUNCTION "public"."文字_文字埋_左"();
DELIMITER ;;
CREATE FUNCTION "public"."文字_文字埋_左"()
  RETURNS "pg_catalog"."varchar" AS $BODY$

BEGIN

-------------------------------------------------
-- 文字列の左に指定文字を埋めて
-- 指定数切り出します。
-- (切り出し指定数になるまで繰り返し埋めます。)
-------------------------------------------------


-- 5文字
--
	RETURN lpad('abc', 5, '012345'); --  --> 結果 : '01abc'

END

$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."文字_文字埋_左"() IS '文字';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."文字_連結"()
-- ----------------------------
DROP FUNCTION "public"."文字_連結"();
DELIMITER ;;
CREATE FUNCTION "public"."文字_連結"()
  RETURNS "pg_catalog"."varchar" AS $BODY$DECLARE
	A VARCHAR(50);
	B VARCHAR(50);

BEGIN
	A:='abc';
	B:='def';

--文字の連結
	RETURN A || B;

END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."文字_連結"() IS '文字';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."変換_型_文字To数値"()
-- ----------------------------
DROP FUNCTION "public"."変換_型_文字To数値"();
DELIMITER ;;
CREATE FUNCTION "public"."変換_型_文字To数値"()
  RETURNS "pg_catalog"."int4" AS $BODY$BEGIN

	RETURN cast('123' || '456' as int4);

	-- 結果 : '123456'
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."変換_型_文字To数値"() IS '変換';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."変換_型_文字To日付"()
-- ----------------------------
DROP FUNCTION "public"."変換_型_文字To日付"();
DELIMITER ;;
CREATE FUNCTION "public"."変換_型_文字To日付"()
  RETURNS "pg_catalog"."date" AS $BODY$BEGIN

	-- 文字から、日付へ変換
	RETURN cast('2013/10/01' as date);

	-- 結果 : '2013-10-01'
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."変換_型_文字To日付"() IS '変換';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."変換_数値To文字_ゼロ埋め"()
-- ----------------------------
DROP FUNCTION "public"."変換_数値To文字_ゼロ埋め"();
DELIMITER ;;
CREATE FUNCTION "public"."変換_数値To文字_ゼロ埋め"()
  RETURNS "pg_catalog"."varchar" AS $BODY$BEGIN

	RETURN to_char(123456, '000000000000');
	--結果 : '000000123456'
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."変換_数値To文字_ゼロ埋め"() IS '変換';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."変換_数値To文字_金額表記"()
-- ----------------------------
DROP FUNCTION "public"."変換_数値To文字_金額表記"();
DELIMITER ;;
CREATE FUNCTION "public"."変換_数値To文字_金額表記"()
  RETURNS "pg_catalog"."varchar" AS $BODY$

BEGIN

	RETURN to_char(123456, '999,999,999,999');
	-- 結果 :  '123,456'

END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."変換_数値To文字_金額表記"() IS '変換';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."変換_文字To数値_001"()
-- ----------------------------
DROP FUNCTION "public"."変換_文字To数値_001"();
DELIMITER ;;
CREATE FUNCTION "public"."変換_文字To数値_001"()
  RETURNS "pg_catalog"."int4" AS $BODY$BEGIN

	RETURN to_number('00123456', '000000000000');
	-- 結果 : '123456'
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."変換_文字To数値_001"() IS '変換';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."変換_文字To数値_002"()
-- ----------------------------
DROP FUNCTION "public"."変換_文字To数値_002"();
DELIMITER ;;
CREATE FUNCTION "public"."変換_文字To数値_002"()
  RETURNS "pg_catalog"."int4" AS $BODY$BEGIN

	RETURN to_number('123,456', '999,999,999,999');
	-- 結果 : '123456'

END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."変換_文字To数値_002"() IS '変換';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."変換_文字To数値_003"()
-- ----------------------------
DROP FUNCTION "public"."変換_文字To数値_003"();
DELIMITER ;;
CREATE FUNCTION "public"."変換_文字To数値_003"()
  RETURNS "pg_catalog"."int4" AS $BODY$BEGIN

	RETURN to_number('123' || '456', '999999999999');
	--
	-- 結果 : '123456'
	--
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."変換_文字To数値_003"() IS '変換';
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for "public"."変換_文字To日付"()
-- ----------------------------
DROP FUNCTION "public"."変換_文字To日付"();
DELIMITER ;;
CREATE FUNCTION "public"."変換_文字To日付"()
  RETURNS "pg_catalog"."date" AS $BODY$BEGIN

	RETURN to_date('20081110', 'YYYYMMDD');

	-- 結果 : '2008-11-10'
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

COMMENT ON FUNCTION "public"."変換_文字To日付"() IS '変換';
;;
DELIMITER ;

-- ----------------------------
--  Records
-- ----------------------------
INSERT INTO "public"."t_test" VALUES ('1','織田'); INSERT INTO "public"."t_test" VALUES ('2','武田'); INSERT INTO "public"."t_test" VALUES ('3','浅井'); INSERT INTO "public"."t_test" VALUES ('4','村上');
INSERT INTO "public"."t_test_cpy" VALUES ('1','織田'); INSERT INTO "public"."t_test_cpy" VALUES ('2','武田'); INSERT INTO "public"."t_test_cpy" VALUES ('3','浅井'); INSERT INTO "public"."t_test_cpy" VALUES ('4','村上');
INSERT INTO "public"."t_test_tmp" VALUES ('1','織田');
INSERT INTO "public"."t_test2" VALUES ('1','a'); INSERT INTO "public"."t_test2" VALUES ('2','b'); INSERT INTO "public"."t_test2" VALUES ('3','c'); INSERT INTO "public"."t_test2" VALUES ('4','d');
INSERT INTO "public"."t_顧客" VALUES ('0','-'); INSERT INTO "public"."t_顧客" VALUES ('6','か'); INSERT INTO "public"."t_顧客" VALUES ('7','あ'); INSERT INTO "public"."t_顧客" VALUES ('8','い'); INSERT INTO "public"."t_顧客" VALUES ('9','う'); INSERT INTO "public"."t_顧客" VALUES ('10','え'); INSERT INTO "public"."t_顧客" VALUES ('11','お');
INSERT INTO "public"."t_顧客_カーソル" VALUES ('0'); INSERT INTO "public"."t_顧客_カーソル" VALUES ('6'); INSERT INTO "public"."t_顧客_カーソル" VALUES ('7'); INSERT INTO "public"."t_顧客_カーソル" VALUES ('8'); INSERT INTO "public"."t_顧客_カーソル" VALUES ('9'); INSERT INTO "public"."t_顧客_カーソル" VALUES ('10'); INSERT INTO "public"."t_顧客_カーソル" VALUES ('11');
INSERT INTO "public"."t_商品" VALUES ('1','鉛筆','300'); INSERT INTO "public"."t_商品" VALUES ('2','シャープペン','150'); INSERT INTO "public"."t_商品" VALUES ('3','消しゴム','100'); INSERT INTO "public"."t_商品" VALUES ('4','定規','120'); INSERT INTO "public"."t_商品" VALUES ('5','筆箱','1000'); INSERT INTO "public"."t_商品" VALUES ('6','赤鉛筆','200');
INSERT INTO "public"."t_年" VALUES ('2009'); INSERT INTO "public"."t_年" VALUES ('2010'); INSERT INTO "public"."t_年" VALUES ('2011'); INSERT INTO "public"."t_年" VALUES ('2012'); INSERT INTO "public"."t_年" VALUES ('2013');
INSERT INTO "public"."t_売上" VALUES ('1','2013-12-03','2500','10',''); INSERT INTO "public"."t_売上" VALUES ('2','2013-12-03','540','11',''); INSERT INTO "public"."t_売上" VALUES ('3','2013-12-04','900','7',''); INSERT INTO "public"."t_売上" VALUES ('4','2013-12-03','1000','9','★'); INSERT INTO "public"."t_売上" VALUES ('5','2013-12-03','300','10',''); INSERT INTO "public"."t_売上" VALUES ('6','2013-12-03','150','9',''); INSERT INTO "public"."t_売上" VALUES ('7','2013-12-03','450','8',''); INSERT INTO "public"."t_売上" VALUES ('8','2013-11-15','1300','10',''); INSERT INTO "public"."t_売上" VALUES ('9','2013-12-03','300','10','★'); INSERT INTO "public"."t_売上" VALUES ('10','2013-12-03','300','7',''); INSERT INTO "public"."t_売上" VALUES ('11','2013-12-03','1000','11',''); INSERT INTO "public"."t_売上" VALUES ('12','2013-12-03','300','6',''); INSERT INTO "public"."t_売上" VALUES ('13','2013-12-03','1220','8',''); INSERT INTO "public"."t_売上" VALUES ('14','2013-12-03','150','9',''); INSERT INTO "public"."t_売上" VALUES ('15','2013-12-03','100','7','★'); INSERT INTO "public"."t_売上" VALUES ('16','2013-12-03','300','7',''); INSERT INTO "public"."t_売上" VALUES ('17','2013-11-03','400','8',''); INSERT INTO "public"."t_売上" VALUES ('18','2013-12-03','1000','8',''); INSERT INTO "public"."t_売上" VALUES ('19','2013-12-04','1000','0','');
INSERT INTO "public"."t_売上月" VALUES ('201212','0'); INSERT INTO "public"."t_売上月" VALUES ('201301','0'); INSERT INTO "public"."t_売上月" VALUES ('201302','0'); INSERT INTO "public"."t_売上月" VALUES ('201303','0'); INSERT INTO "public"."t_売上月" VALUES ('201304','0'); INSERT INTO "public"."t_売上月" VALUES ('201305','0'); INSERT INTO "public"."t_売上月" VALUES ('201306','0'); INSERT INTO "public"."t_売上月" VALUES ('201307','0'); INSERT INTO "public"."t_売上月" VALUES ('201308','0'); INSERT INTO "public"."t_売上月" VALUES ('201310','0'); INSERT INTO "public"."t_売上月" VALUES ('201311','1700'); INSERT INTO "public"."t_売上月" VALUES ('201312','11510');
INSERT INTO "public"."t_売上詳細" VALUES ('1','1','2','600','1'); INSERT INTO "public"."t_売上詳細" VALUES ('2','2','2','300','1'); INSERT INTO "public"."t_売上詳細" VALUES ('4','3','4','400','4'); INSERT INTO "public"."t_売上詳細" VALUES ('5','3','1','100','3'); INSERT INTO "public"."t_売上詳細" VALUES ('6','3','2','200','3'); INSERT INTO "public"."t_売上詳細" VALUES ('7','4','5','600','3'); INSERT INTO "public"."t_売上詳細" VALUES ('8','5','1','1000','1'); INSERT INTO "public"."t_売上詳細" VALUES ('10','1','2','600','1'); INSERT INTO "public"."t_売上詳細" VALUES ('12','1','1','300','4'); INSERT INTO "public"."t_売上詳細" VALUES ('13','1','1','300','4'); INSERT INTO "public"."t_売上詳細" VALUES ('18','4','1','120','2'); INSERT INTO "public"."t_売上詳細" VALUES ('19','1','1','300','2'); INSERT INTO "public"."t_売上詳細" VALUES ('25','4','1','120','2'); INSERT INTO "public"."t_売上詳細" VALUES ('27','1','1','300','5'); INSERT INTO "public"."t_売上詳細" VALUES ('28','1','1','300','7'); INSERT INTO "public"."t_売上詳細" VALUES ('29','2','1','150','7'); INSERT INTO "public"."t_売上詳細" VALUES ('30','5','1','1000','8'); INSERT INTO "public"."t_売上詳細" VALUES ('31','2','1','150','6'); INSERT INTO "public"."t_売上詳細" VALUES ('32','3','1','100','13'); INSERT INTO "public"."t_売上詳細" VALUES ('33','2','1','150','14'); INSERT INTO "public"."t_売上詳細" VALUES ('34','1','1','300','8'); INSERT INTO "public"."t_売上詳細" VALUES ('35','2','1','150','12'); INSERT INTO "public"."t_売上詳細" VALUES ('36','1','1','300','9'); INSERT INTO "public"."t_売上詳細" VALUES ('37','2','1','150','12'); INSERT INTO "public"."t_売上詳細" VALUES ('38','5','1','1000','11'); INSERT INTO "public"."t_売上詳細" VALUES ('39','1','1','300','10'); INSERT INTO "public"."t_売上詳細" VALUES ('40','4','1','120','13'); INSERT INTO "public"."t_売上詳細" VALUES ('41','5','1','1000','13'); INSERT INTO "public"."t_売上詳細" VALUES ('42','1','1','300','16'); INSERT INTO "public"."t_売上詳細" VALUES ('43','3','1','100','15'); INSERT INTO "public"."t_売上詳細" VALUES ('44','3','1','100','17'); INSERT INTO "public"."t_売上詳細" VALUES ('45','1','1','300','17'); INSERT INTO "public"."t_売上詳細" VALUES ('46','5','1','1000','18'); INSERT INTO "public"."t_売上詳細" VALUES ('47','5','1','1000','19');
INSERT INTO "public"."t_曜日" VALUES ('0','日'); INSERT INTO "public"."t_曜日" VALUES ('1','月'); INSERT INTO "public"."t_曜日" VALUES ('2','火'); INSERT INTO "public"."t_曜日" VALUES ('3','水'); INSERT INTO "public"."t_曜日" VALUES ('4','木'); INSERT INTO "public"."t_曜日" VALUES ('5','金'); INSERT INTO "public"."t_曜日" VALUES ('6','土');
INSERT INTO "public"."test" VALUES ('1','A'); INSERT INTO "public"."test" VALUES ('2','B'); INSERT INTO "public"."test" VALUES ('3','C'); INSERT INTO "public"."test" VALUES ('4','D'); INSERT INTO "public"."test" VALUES ('5','E');
