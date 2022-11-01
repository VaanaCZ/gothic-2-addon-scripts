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
	AI_Output (self, other, "DIA_Sld_820_Halt_07_00"); //Kam si myslíš, že jdeš?
	AI_Output (other, self, "DIA_Sld_820_Halt_15_01"); //Dovnitâ, samozâejmę.
	AI_Output (self, other, "DIA_Sld_820_Halt_07_02"); //Onar nám neplatí za to, že sem pouštíme takový otrapy jako ty!

	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Sld_820_Halt_07_03"); //Nechci tu vidęt nikoho z domobrany! - To jsou jeho vlastní slova.
	};

	AI_Output (other, self, "DIA_Sld_820_Halt_15_04"); //Chci mluvit s Leem!
	AI_Output (self, other, "DIA_Sld_820_Halt_07_05"); //Co po nęm chceš?
	
	Info_ClearChoices (DIA_Sld_820_Halt);
	Info_AddChoice (DIA_Sld_820_Halt, "Já se s ním znám už hroznę dlouho.", DIA_Sld_820_Halt_KenneLee);
	if (other.guild == GIL_NONE)
	{
		Info_AddChoice (DIA_Sld_820_Halt, "Chci se pâidat k žoldnéâům!", DIA_Sld_820_Halt_WannaJoin);
	};
};

func void B_Sld_820_LeeIsRight()
{
	AI_Output (self, other, "B_Sld_820_LeeIsRight_07_00"); //Lee je v pravém kâídle. Aă tę ani nenapadne zabloudit nękam jinam!
};

func void DIA_Sld_820_Halt_WannaJoin()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_WannaJoin_15_00"); //Chci se pâidat k žoldnéâům!
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_01"); //Á, další voják, kterého můžeme obętovat! Tak pojë dál!
	B_Sld_820_LeeIsRight();
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_02"); //Ale hlavnę nech na pokoji Onara! Nemá rád, když na nęj nękdo mluví bez vyzvání. Zvlášă když jde o nękoho jako ty.
	AI_StopProcessInfos	(self);
};

func void DIA_Sld_820_Halt_KenneLee()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_KenneLee_15_00"); //Já se s ním znám už hroznę dlouho.
	AI_Output (self, other, "DIA_Sld_820_Halt_KenneLee_07_01"); //TY že jsi Leeův kámoš? Nevęâím ti ani slovo! Ale klidnę pojë dál - jestli se na tebe nebude pamatovat, tak to poznáš hned! (smęje se)
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
	AI_Output (self, other, "DIA_Sld_820_PERM_07_01"); //Bęž dál, jestli chceš, ale svý žvásty si nech pro sebe.
	AI_StopProcessInfos	(self);
};










	
	
	
	


























