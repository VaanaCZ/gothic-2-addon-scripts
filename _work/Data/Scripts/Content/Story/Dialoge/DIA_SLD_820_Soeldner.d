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
	AI_Output (self, other, "DIA_Sld_820_Halt_07_00"); //A ty gdzie leziesz?
	AI_Output (other, self, "DIA_Sld_820_Halt_15_01"); //Do domu, oczywi�cie.
	AI_Output (self, other, "DIA_Sld_820_Halt_07_02"); //Onar p�aci nam za to, by�my nie wpuszczali tu takich jak ty!

	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Sld_820_Halt_07_03"); //Nie wa�cie mi si� wpuszcza� stra�nik�w! - to jego dok�adne s�owa.
	};

	AI_Output (other, self, "DIA_Sld_820_Halt_15_04"); //Chc� pogada� z Lee!
	AI_Output (self, other, "DIA_Sld_820_Halt_07_05"); //Czego od niego chcesz?
	
	Info_ClearChoices (DIA_Sld_820_Halt);
	Info_AddChoice (DIA_Sld_820_Halt, "On i ja znamy si� od dawna...", DIA_Sld_820_Halt_KenneLee);
	if (other.guild == GIL_NONE)
	{
		Info_AddChoice (DIA_Sld_820_Halt, "Chc� si� przy��czy� do najemnik�w. Masz co� przeciwko temu?", DIA_Sld_820_Halt_WannaJoin);
	};
};

func void B_Sld_820_LeeIsRight()
{
	AI_Output (self, other, "B_Sld_820_LeeIsRight_07_00"); //Lee jest w prawym skrzydle. Nawet nie my�l o wa��saniu si� gdzie indziej!
};

func void DIA_Sld_820_Halt_WannaJoin()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_WannaJoin_15_00"); //Chc� si� przy��czy� do najemnik�w. Masz co� przeciwko temu?
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_01"); //Ach, �wie�e mi�so armatnie! Wchod�, wchod� do �rodka.
	B_Sld_820_LeeIsRight();
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_02"); //Ale pami�taj, trzymaj si� z daleka od Onara! Nie lubi, kiedy ktokolwiek si� do niego odzywa, tym bardziej bez pytania. Szczeg�lnie za� nie lubi takich jak ty.
	AI_StopProcessInfos	(self);
};

func void DIA_Sld_820_Halt_KenneLee()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_KenneLee_15_00"); //On i ja znamy si� od dawna...
	AI_Output (self, other, "DIA_Sld_820_Halt_KenneLee_07_01"); //JESTE� kumplem Lee? Nie wierz�! Ale wchod�, je�li Lee ci� nie pozna, od razu si� domy�lisz...
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
	description = "Co s�ycha�?";
};                       

FUNC INT DIA_Sld_820_PERM_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sld_820_PERM_Info()
{	
	AI_Output (other, self, "DIA_Sld_820_PERM_15_00"); //Jak leci?
	AI_Output (self, other, "DIA_Sld_820_PERM_07_01"); //Wejd�, je�li chcesz, ale nie odzywaj si� do mnie.
	AI_StopProcessInfos	(self);
};










	
	
	
	


























