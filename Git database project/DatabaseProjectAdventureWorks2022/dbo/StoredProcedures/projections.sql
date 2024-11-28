
create   procedure dbo.projections
	(
		@crt_mnt_py decimal(9,2)
	)
as
declare @str_p decimal(9,2), @inc_prc decimal(9,5) = 1.15

select @str_p = 2983.00 * 1.15

;with yar_mnt as
(
   select *, ROW_NUMBER() over(order by (select 1)) as mnt_num
   from (values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10)) as mnts(mnt)
   cross join 
   (values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12) )	as yrs (yr)
   
), inc_brk as 
(
	select *, abs(mnt_num / 6) brk from yar_mnt
), prc as
(
	select *, @str_p as str_p, POWER(@inc_prc, brk) rs from inc_brk
), ps as
(
	select *, str_p * rs inc_py from prc
),txs as
(
	select *, 0.0835 doo, 0.0220 dzpo, 0.0320 zo, 0.1 ddfl from ps
), txss as 
(
	select *, cast(iif(inc_py>3750, 3750, inc_py) * doo as decimal(9,2)) [doo_cst], cast(iif(inc_py>3750, 3750, inc_py) * dzpo as decimal(9,2)) [dzpo_cst], cast(iif(inc_py>3750, 3750, inc_py) * zo as decimal(9,2)) [zo_cst], cast(iif(inc_py>3750, 3750, inc_py) * ddfl as decimal(9,2)) [ddfl_cst] from txs
), ps_fnl as 
( 
	select	mnt, yr, mnt_num, rs, inc_py, 
			(doo_cst + dzpo_cst + zo_cst + ddfl_cst) txs_tot_cst, 
			cast(inc_py - (doo_cst + dzpo_cst + zo_cst + ddfl_cst) as decimal(9,2)) afr_tx
	from txss
), tht_prc_sv as
(
	select *,	iif(afr_tx > 4000, 4000, afr_tx) as expt, 
				iif(afr_tx > 4000, 4000, afr_tx) - @crt_mnt_py as afr_crt , 
				@crt_mnt_py * mnt_num as acl_dbt,
				afr_tx - iif(afr_tx > 4000, 4000, afr_tx) as lst,
				iif(afr_tx > 4000, 4000, afr_tx) * 0.2 as to_sv20, 
				iif(afr_tx > 4000, 4000, afr_tx) * 0.3 as to_sv30, 
				iif(afr_tx > 4000, 4000, afr_tx) * 0.4 as to_sv40,
				iif(afr_tx > 4000, 4000, afr_tx) * 0.5 as to_sv50,
				iif(afr_tx > 4000, 4000, afr_tx) * 0.6 as to_sv60
	from ps_fnl
)
select *,	cast(to_sv20 * mnt_num as decimal(9,2)) acml_sv20,
			cast(to_sv30 * mnt_num as decimal(9,2)) acml_sv30,
			cast(to_sv40 * mnt_num as decimal(9,2)) acml_sv40,
			cast(to_sv50 * mnt_num as decimal(9,2)) acml_sv50,
			cast(to_sv60 * mnt_num as decimal(9,2)) acml_sv60,
			cast(expt - to_sv20 as decimal(9,2)) aft_20sv_no_crt,
			cast(expt - to_sv30 as decimal(9,2)) aft_30sv_no_crt,
			cast(expt - to_sv40 as decimal(9,2)) aft_40sv_no_crt,
			cast(afr_crt - to_sv20 as decimal(9,2)) aft_20sv_wt_crt,
			cast(afr_crt - to_sv30 as decimal(9,2)) aft_30sv_wt_crt,
			cast(afr_crt - to_sv40 as decimal(9,2)) aft_40sv_wt_crt
from tht_prc_sv

GO

