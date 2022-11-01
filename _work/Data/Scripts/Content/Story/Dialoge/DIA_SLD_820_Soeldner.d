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
	AI_Output (self, other, "DIA_Sld_820_Halt_07_00"); //¿Adónde te crees que vas?
	AI_Output (other, self, "DIA_Sld_820_Halt_15_01"); //A la casa, claro.
	AI_Output (self, other, "DIA_Sld_820_Halt_07_02"); //¡Onar nos paga para que no dejemos entrenar a tipos como tú!

	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Sld_820_Halt_07_03"); //¡No dejéis que entre la milicia! Ésas fueron sus palabras exactas.
	};

	AI_Output (other, self, "DIA_Sld_820_Halt_15_04"); //¡Quiero hablar con Lee!
	AI_Output (self, other, "DIA_Sld_820_Halt_07_05"); //¿Qué quieres de él?
	
	Info_ClearChoices (DIA_Sld_820_Halt);
	Info_AddChoice (DIA_Sld_820_Halt, "Nos conocemos de hace bastante...", DIA_Sld_820_Halt_KenneLee);
	if (other.guild == GIL_NONE)
	{
		Info_AddChoice (DIA_Sld_820_Halt, "¡Quiero unirme a los mercenarios!", DIA_Sld_820_Halt_WannaJoin);
	};
};

func void B_Sld_820_LeeIsRight()
{
	AI_Output (self, other, "B_Sld_820_LeeIsRight_07_00"); //Lee está en el ala derecha. ¡Ni se te ocurra rondar por otro lado!
};

func void DIA_Sld_820_Halt_WannaJoin()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_WannaJoin_15_00"); //¡Quiero unirme a los mercenarios!
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_01"); //¡Ah, más carne de cañón! Entonces, entra.
	B_Sld_820_LeeIsRight();
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_02"); //Pero, lo más importante, ¡deja a Onar en paz! No le gusta que le hable la gente si no les pregunta. Especialmente los tipos como tú.
	AI_StopProcessInfos	(self);
};

func void DIA_Sld_820_Halt_KenneLee()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_KenneLee_15_00"); //Nos conocemos de hace bastante...
	AI_Output (self, other, "DIA_Sld_820_Halt_KenneLee_07_01"); //¿ERES colega de Lee? ¡No me lo creo! Pero sigue, si no te reconoce, te darás cuenta... (se ríe).
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
	description = "¿Qué pasa?";
};                       

FUNC INT DIA_Sld_820_PERM_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sld_820_PERM_Info()
{	
	AI_Output (other, self, "DIA_Sld_820_PERM_15_00"); //¿Cómo va todo?
	AI_Output (self, other, "DIA_Sld_820_PERM_07_01"); //Sigue si quieres, me no me des la tabarra.
	AI_StopProcessInfos	(self);
};










	
	
	
	


























