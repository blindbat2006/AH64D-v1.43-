private ["_heli"];
_heli = _this select 0;
if(player == driver _heli && (vehicle player) isKindOf "fza_ah64base") then
{
		if(inputaction "nextCM" == 1 && fza_ah64_cmpressed == 0) then {fza_ah64_cmsel = fza_ah64_cmsel + 1; fza_ah64_cmpressed = 1;};
		if(inputaction "nextCM" == 0 && fza_ah64_cmpressed == 1) then {fza_ah64_cmpressed = 0;};
		if(fza_ah64_cmsel > 1 && count (_heli weaponsTurret [-1]) < 2) then {fza_ah64_cmsel = 0;};
		if(fza_ah64_cmsel > 3 && count (_heli weaponsTurret [-1]) > 1) then {fza_ah64_cmsel = 0;};
			fza_ah64_headdir = (-0.125*(inputaction "AimLeft" + (0.125 * inputaction "LookLeft"))) + (0.125*(inputaction "AimRight" + (0.125 * inputaction "LookRight")));
			fza_ah64_headelev = (0.125*(inputaction "AimUp" + (0.125 * inputaction "LookUp"))) + (-0.125*(inputaction "AimDown" + (0.125 * inputaction "LookDown")));
			_headcenter = inputaction "LookCenter";
			if(_headcenter > 0) then
			{
				fza_ah64_pnvsdir = 0;
				fza_ah64_pnvselev = 0.5;
				fza_ah64_turdir = 0;
				fza_ah64_turelev = 0;
			};
			fza_ah64_pnvsdir = fza_ah64_pnvsdir + fza_ah64_headdir;
			fza_ah64_pnvselev = fza_ah64_pnvselev + fza_ah64_headelev;
			if(fza_ah64_tiron) then {fza_ah64_pnvselev = (-5*(inputaction "LookDownCont")) + (5*(inputaction "LookUpCont")) + 0.5; fza_ah64_pnvsdir = (-1.5*(inputaction "LookLeftCont")) + (1.5*(inputaction "LookRightCont"));};
			if(fza_ah64_pnvsdir > 0.75) then {fza_ah64_pnvsdir = 0.75;};
			if(fza_ah64_pnvsdir < -0.75) then {fza_ah64_pnvsdir = -0.75;};
			if(fza_ah64_estate > -1 && !(isengineon _heli)) then {fza_ah64_estate = fza_ah64_estate - 0.02; fza_ah64_pnvsdir = fza_ah64_estate;};
			if(isengineon _heli && fza_ah64_estate < 0) then {fza_ah64_estate = fza_ah64_estate + 0.02; fza_ah64_pnvsdir = fza_ah64_estate;};
			if(fza_ah64_estate < -0.98 && !(isengineon _heli)) then {fza_ah64_pnvsdir = -1; fza_ah64_estate = -1;};
			if(fza_ah64_estate > -0.02 && (isengineon _heli)) then {fza_ah64_estate = 0;};
			if("fza_ah64_pnvs_fail" in (_heli magazinesturret [-1])) then {fza_ah64_pnvsdir = -1; fza_ah64_pnvselev = 1;};
			_heli animate ["pnvs",fza_ah64_pnvsdir];
			_heli animate ["pnvs_vert",fza_ah64_pnvselev];
};