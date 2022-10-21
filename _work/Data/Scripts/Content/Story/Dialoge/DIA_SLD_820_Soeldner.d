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
	AI_Output (other, self, "DIA_Sld_820_Halt_15_01"); //Do domu, oczywiœcie.
	AI_Output (self, other, "DIA_Sld_820_Halt_07_02"); //Onar p³aci nam za to, byœmy nie wpuszczali tu takich jak ty!

	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Sld_820_Halt_07_03"); //Nie wa¿cie mi siê wpuszczaæ stra¿ników! - to jego dok³adne s³owa.
	};

	AI_Output (other, self, "DIA_Sld_820_Halt_15_04"); //Chcê pogadaæ z Lee!
	AI_Output (self, other, "DIA_Sld_820_Halt_07_05"); //Czego od niego chcesz?
	
	Info_ClearChoices (DIA_Sld_820_Halt);
	Info_AddChoice (DIA_Sld_820_Halt, "On i ja znamy siê od dawna...", DIA_Sld_820_Halt_KenneLee);
	if (other.guild == GIL_NONE)
	{
		Info_AddChoice (DIA_Sld_820_Halt, "Chcê siê przy³¹czyæ do najemników. Masz coœ przeciwko temu?", DIA_Sld_820_Halt_WannaJoin);
	};
};

func void B_Sld_820_LeeIsRight()
{
	AI_Output (self, other, "B_Sld_820_LeeIsRight_07_00"); //Lee jest w prawym skrzydle. Nawet nie myœl o wa³êsaniu siê gdzie indziej!
};

func void DIA_Sld_820_Halt_WannaJoin()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_WannaJoin_15_00"); //Chcê siê przy³¹czyæ do najemników. Masz coœ przeciwko temu?
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_01"); //Ach, œwie¿e miêso armatnie! WchodŸ, wchodŸ do œrodka.
	B_Sld_820_LeeIsRight();
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_02"); //Ale pamiêtaj, trzymaj siê z daleka od Onara! Nie lubi, kiedy ktokolwiek siê do niego odzywa, tym bardziej bez pytania. Szczególnie zaœ nie lubi takich jak ty.
	AI_StopProcessInfos	(self);
};

func void DIA_Sld_820_Halt_KenneLee()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_KenneLee_15_00"); //On i ja znamy siê od dawna...
	AI_Output (self, other, "DIA_Sld_820_Halt_KenneLee_07_01"); //JESTEŒ kumplem Lee? Nie wierzê! Ale wchodŸ, jeœli Lee ciê nie pozna, od razu siê domyœlisz...
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
	description = "Co s³ychaæ?";
};                       

FUNC INT DIA_Sld_820_PERM_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sld_820_PERM_Info()
{	
	AI_Output (other, self, "DIA_Sld_820_PERM_15_00"); //Jak leci?
	AI_Output (self, other, "DIA_Sld_820_PERM_07_01"); //WejdŸ, jeœli chcesz, ale nie odzywaj siê do mnie.
	AI_StopProcessInfos	(self);
};










	
	
	
	


























