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
	AI_Output (self, other, "DIA_Sld_820_Halt_07_00"); //Kam si myslÌö, ûe jdeö?
	AI_Output (other, self, "DIA_Sld_820_Halt_15_01"); //Dovnit¯, samoz¯ejmÏ.
	AI_Output (self, other, "DIA_Sld_820_Halt_07_02"); //Onar n·m neplatÌ za to, ûe sem pouötÌme takov˝ otrapy jako ty!

	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Sld_820_Halt_07_03"); //Nechci tu vidÏt nikoho z domobrany! - To jsou jeho vlastnÌ slova.
	};

	AI_Output (other, self, "DIA_Sld_820_Halt_15_04"); //Chci mluvit s Leem!
	AI_Output (self, other, "DIA_Sld_820_Halt_07_05"); //Co po nÏm chceö?
	
	Info_ClearChoices (DIA_Sld_820_Halt);
	Info_AddChoice (DIA_Sld_820_Halt, "J· se s nÌm zn·m uû hroznÏ dlouho.", DIA_Sld_820_Halt_KenneLee);
	if (other.guild == GIL_NONE)
	{
		Info_AddChoice (DIA_Sld_820_Halt, "Chci se p¯idat k ûoldnÈ¯˘m!", DIA_Sld_820_Halt_WannaJoin);
	};
};

func void B_Sld_820_LeeIsRight()
{
	AI_Output (self, other, "B_Sld_820_LeeIsRight_07_00"); //Lee je v pravÈm k¯Ìdle. Aù tÏ ani nenapadne zabloudit nÏkam jinam!
};

func void DIA_Sld_820_Halt_WannaJoin()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_WannaJoin_15_00"); //Chci se p¯idat k ûoldnÈ¯˘m!
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_01"); //¡, dalöÌ voj·k, kterÈho m˘ûeme obÏtovat! Tak pojÔ d·l!
	B_Sld_820_LeeIsRight();
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_02"); //Ale hlavnÏ nech na pokoji Onara! Nem· r·d, kdyû na nÏj nÏkdo mluvÌ bez vyzv·nÌ. Zvl·öù kdyû jde o nÏkoho jako ty.
	AI_StopProcessInfos	(self);
};

func void DIA_Sld_820_Halt_KenneLee()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_KenneLee_15_00"); //J· se s nÌm zn·m uû hroznÏ dlouho.
	AI_Output (self, other, "DIA_Sld_820_Halt_KenneLee_07_01"); //TY ûe jsi Lee˘v k·moö? NevÏ¯Ìm ti ani slovo! Ale klidnÏ pojÔ d·l - jestli se na tebe nebude pamatovat, tak to pozn·ö hned! (smÏje se)
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
	AI_Output (self, other, "DIA_Sld_820_PERM_07_01"); //BÏû d·l, jestli chceö, ale sv˝ ûv·sty si nech pro sebe.
	AI_StopProcessInfos	(self);
};










	
	
	
	


























