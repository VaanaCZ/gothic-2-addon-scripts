// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Sld_820_EXIT(C_INFO)
{
	npc			= Sld_820_Soeldner;
	nr			= 999;
	condition	= DIA_Sld_820_EXIT_Condition;
	information	= DIA_Sld_820_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Sld_820_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sld_820_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Halt 
// ************************************************************

INSTANCE DIA_Sld_820_Halt (C_INFO)
{
	npc			= Sld_820_Soeldner;
	nr			= 1;
	condition	= DIA_Sld_820_Halt_Condition;
	information	= DIA_Sld_820_Halt_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Sld_820_Halt_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Sld_820_Halt_Info()
{	
	AI_Output (self, other, "DIA_Sld_820_Halt_07_00"); //Kam si mysl�, �e jde�?
	AI_Output (other, self, "DIA_Sld_820_Halt_15_01"); //Dovnit�, samoz�ejm�.
	AI_Output (self, other, "DIA_Sld_820_Halt_07_02"); //Onar n�m neplat� za to, �e sem pou�t�me takov� otrapy jako ty!

	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Sld_820_Halt_07_03"); //Nechci tu vid�t nikoho z domobrany! - To jsou jeho vlastn� slova.
	};

	AI_Output (other, self, "DIA_Sld_820_Halt_15_04"); //Chci mluvit s Leem!
	AI_Output (self, other, "DIA_Sld_820_Halt_07_05"); //Co po n�m chce�?
	
	Info_ClearChoices (DIA_Sld_820_Halt);
	Info_AddChoice (DIA_Sld_820_Halt, "J� se s n�m zn�m u� hrozn� dlouho.", DIA_Sld_820_Halt_KenneLee);
	if (other.guild == GIL_NONE)
	{
		Info_AddChoice (DIA_Sld_820_Halt, "Chci se p�idat k �oldn���m!", DIA_Sld_820_Halt_WannaJoin);
	};
};

func void B_Sld_820_LeeIsRight()
{
	AI_Output (self, other, "B_Sld_820_LeeIsRight_07_00"); //Lee je v prav�m k��dle. A� t� ani nenapadne zabloudit n�kam jinam!
};

func void DIA_Sld_820_Halt_WannaJoin()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_WannaJoin_15_00"); //Chci se p�idat k �oldn���m!
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_01"); //�, dal�� voj�k, kter�ho m��eme ob�tovat! Tak poj� d�l!
	B_Sld_820_LeeIsRight();
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_02"); //Ale hlavn� nech na pokoji Onara! Nem� r�d, kdy� na n�j n�kdo mluv� bez vyzv�n�. Zvl�� kdy� jde o n�koho jako ty.
	AI_StopProcessInfos	(self);
};

func void DIA_Sld_820_Halt_KenneLee()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_KenneLee_15_00"); //J� se s n�m zn�m u� hrozn� dlouho.
	AI_Output (self, other, "DIA_Sld_820_Halt_KenneLee_07_01"); //TY �e jsi Lee�v k�mo�? Nev���m ti ani slovo! Ale klidn� poj� d�l - jestli se na tebe nebude pamatovat, tak to pozn� hned! (sm�je se)
	B_Sld_820_LeeIsRight();
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   PERM 
// ************************************************************

INSTANCE DIA_Sld_820_PERM(C_INFO)
{
	npc			= Sld_820_Soeldner;
	nr			= 1;
	condition	= DIA_Sld_820_PERM_Condition;
	information	= DIA_Sld_820_PERM_Info;
	permanent	= TRUE;
	description = "Jak to jde?";
};                       

FUNC INT DIA_Sld_820_PERM_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sld_820_PERM_Info()
{	
	AI_Output (other, self, "DIA_Sld_820_PERM_15_00"); //Jak se vede?
	AI_Output (self, other, "DIA_Sld_820_PERM_07_01"); //B� d�l, jestli chce�, ale sv� �v�sty si nech pro sebe.
	AI_StopProcessInfos	(self);
};










	
	
	
	


























