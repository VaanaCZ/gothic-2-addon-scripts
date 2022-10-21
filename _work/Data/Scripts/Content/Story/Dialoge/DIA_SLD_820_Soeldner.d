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
	AI_Output (self, other, "DIA_Sld_820_Halt_07_00"); //Dove pensi di andare?
	AI_Output (other, self, "DIA_Sld_820_Halt_15_01"); //Alla casa, naturalmente.
	AI_Output (self, other, "DIA_Sld_820_Halt_07_02"); //Onar ci paga proprio per non far passare la gente come te!

	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Sld_820_Halt_07_03"); //Non fate passare nessun soldato dell'esercito! Queste sono esattamente le sue parole.
	};

	AI_Output (other, self, "DIA_Sld_820_Halt_15_04"); //Voglio parlare con Lee!
	AI_Output (self, other, "DIA_Sld_820_Halt_07_05"); //Cosa vuoi da lui?
	
	Info_ClearChoices (DIA_Sld_820_Halt);
	Info_AddChoice (DIA_Sld_820_Halt, "Lui e io torniamo indietro...", DIA_Sld_820_Halt_KenneLee);
	if (other.guild == GIL_NONE)
	{
		Info_AddChoice (DIA_Sld_820_Halt, "Voglio unirmi ai mercenari!", DIA_Sld_820_Halt_WannaJoin);
	};
};

func void B_Sld_820_LeeIsRight()
{
	AI_Output (self, other, "B_Sld_820_LeeIsRight_07_00"); //Lee si trova nell'ala destra. Non provare nemmeno a girovagare da altre parti!
};

func void DIA_Sld_820_Halt_WannaJoin()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_WannaJoin_15_00"); //Voglio unirmi ai mercenari!
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_01"); //Ah, nuova carne da macello! Entra allora.
	B_Sld_820_LeeIsRight();
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_02"); //Ma, soprattutto, lascia in pace Onar! Egli non ama che la gente gli parli senza il suo permesso. Specialmente quelli come te.
	AI_StopProcessInfos	(self);
};

func void DIA_Sld_820_Halt_KenneLee()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_KenneLee_15_00"); //Lui ed io torniamo indietro...
	AI_Output (self, other, "DIA_Sld_820_Halt_KenneLee_07_01"); //TU saresti un compagno di Lee? Non credo a una parola di quello che dici! Ma entra pure, se non ti riconoscerà, te ne accorgerai... (ride)
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
	description = "Cosa succede?";
};                       

FUNC INT DIA_Sld_820_PERM_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sld_820_PERM_Info()
{	
	AI_Output (other, self, "DIA_Sld_820_PERM_15_00"); //Come va?
	AI_Output (self, other, "DIA_Sld_820_PERM_07_01"); //Entra, se vuoi, ma non farmi perdere tempo.
	AI_StopProcessInfos	(self);
};










	
	
	
	


























