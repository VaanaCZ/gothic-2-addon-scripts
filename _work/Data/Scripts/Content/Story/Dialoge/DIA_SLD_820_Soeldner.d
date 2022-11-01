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
	AI_Output (other, self, "DIA_Sld_820_Halt_15_01"); //Do domu, oczywiście.
	AI_Output (self, other, "DIA_Sld_820_Halt_07_02"); //Onar płaci nam za to, byśmy nie wpuszczali tu takich jak ty!

	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Sld_820_Halt_07_03"); //Nie ważcie mi się wpuszczać strażników! - to jego dokładne słowa.
	};

	AI_Output (other, self, "DIA_Sld_820_Halt_15_04"); //Chcę pogadać z Lee!
	AI_Output (self, other, "DIA_Sld_820_Halt_07_05"); //Czego od niego chcesz?
	
	Info_ClearChoices (DIA_Sld_820_Halt);
	Info_AddChoice (DIA_Sld_820_Halt, "On i ja znamy się od dawna...", DIA_Sld_820_Halt_KenneLee);
	if (other.guild == GIL_NONE)
	{
		Info_AddChoice (DIA_Sld_820_Halt, "Chcę się przyłączyć do najemników. Masz coś przeciwko temu?", DIA_Sld_820_Halt_WannaJoin);
	};
};

func void B_Sld_820_LeeIsRight()
{
	AI_Output (self, other, "B_Sld_820_LeeIsRight_07_00"); //Lee jest w prawym skrzydle. Nawet nie myśl o wałęsaniu się gdzie indziej!
};

func void DIA_Sld_820_Halt_WannaJoin()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_WannaJoin_15_00"); //Chcę się przyłączyć do najemników. Masz coś przeciwko temu?
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_01"); //Ach, świeże mięso armatnie! Wchodź, wchodź do środka.
	B_Sld_820_LeeIsRight();
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_02"); //Ale pamiętaj, trzymaj się z daleka od Onara! Nie lubi, kiedy ktokolwiek się do niego odzywa, tym bardziej bez pytania. Szczególnie zaś nie lubi takich jak ty.
	AI_StopProcessInfos	(self);
};

func void DIA_Sld_820_Halt_KenneLee()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_KenneLee_15_00"); //On i ja znamy się od dawna...
	AI_Output (self, other, "DIA_Sld_820_Halt_KenneLee_07_01"); //JESTEŚ kumplem Lee? Nie wierzę! Ale wchodź, jeśli Lee cię nie pozna, od razu się domyślisz...
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
	description = "Co słychać?";
};                       

FUNC INT DIA_Sld_820_PERM_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sld_820_PERM_Info()
{	
	AI_Output (other, self, "DIA_Sld_820_PERM_15_00"); //Jak leci?
	AI_Output (self, other, "DIA_Sld_820_PERM_07_01"); //Wejdź, jeśli chcesz, ale nie odzywaj się do mnie.
	AI_StopProcessInfos	(self);
};










	
	
	
	


























