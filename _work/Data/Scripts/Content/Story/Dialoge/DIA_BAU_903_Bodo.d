// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Bodo_EXIT   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 999;
	condition   = DIA_Bodo_EXIT_Condition;
	information = DIA_Bodo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Bodo_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				  Hallo (PERM) 
// ************************************************************
INSTANCE DIA_Bodo_Hallo   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 1;
	condition   = DIA_Bodo_Hallo_Condition;
	information = DIA_Bodo_Hallo_Info;
	permanent   = TRUE;
	description = "Come va?";
};
FUNC INT DIA_Bodo_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Hallo_Info()
{
	AI_Output (other, self, "DIA_Bodo_Hallo_15_00"); //Come va?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_01"); //La guardia cittadina ci ha tiranneggiato troppo a lungo. Ora che i mercenari sono dalla nostra parte, essi non oseranno più farsi vedere qui.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_02"); //Il re crede di poter prendere tutto ciò che vuole, ma ora non glielo permetteremo più.
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_03"); //Bene. Se dovessi incontrare degli uomini della guardia cittadina, picchiane uno per me, d'accordo?
	};
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_04"); //Bene. Innos sia con te.
	};
			
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{	
		AI_Output (self, other, "DIA_Bodo_Hallo_12_05"); //Le truppe del re non sono le benvenute alla fattoria.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_06"); //Molte delle persone qui presenti ti rivolgeranno comunque la parola, ma non sarai di certo ben visto.
	};
};

// ************************************************************
// 			  				 Bauernaufstand
// ************************************************************
INSTANCE DIA_Bodo_Bauernaufstand   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 2;
	condition   = DIA_Bodo_Bauernaufstand_Condition;
	information = DIA_Bodo_Bauernaufstand_Info;
	permanent   = FALSE;
	description = "In città si parla di una rivolta di contadini!";
};
FUNC INT DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bauernaufstand_15_00"); //In città si parla di una rivolta di contadini!
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_01"); //Stupidaggini. Non stiamo facendo altro che difendere ciò per cui abbiamo lavorato sodo.
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_02"); //È certamente vero che i costi della guerra gravano sulle spalle dei contadini e Onar non è più disposto a stare a guardare mentre il re ci dissangua.
};

// ************************************************************
// 			  				   Bett
// ************************************************************
INSTANCE DIA_Bodo_Bett   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 3;
	condition   = DIA_Bodo_Bett_Condition;
	information = DIA_Bodo_Bett_Info;
	permanent   = FALSE;
	description = "Posso riposarmi qui da qualche parte?";
};
FUNC INT DIA_Bodo_Bett_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bett_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bett_15_00"); //Posso riposarmi qui da qualche parte?
	AI_Output (self, other, "DIA_Bodo_Bett_12_01"); //Se cerchi un posto dove dormire, vai nella stalla, ma non sdraiarti per sbaglio sul letto di un mercenario.
	AI_Output (self, other, "DIA_Bodo_Bett_12_02"); //Onar vuole che i mercenari lascino in pace noi contadini, ma con gli stranieri che non sono della fattoria essi possono fare ciò che gli pare.
};

// ************************************************************
// 			  				   Cipher
// ************************************************************
INSTANCE DIA_Bodo_Cipher   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 4;
	condition   = DIA_Bodo_Cipher_Condition;
	information = DIA_Bodo_Cipher_Info;
	permanent   = FALSE;
	description = "Cipher mi ha detto che qualcuno gli ha rubato una confezione di erba di palude...";
};
FUNC INT DIA_Bodo_Cipher_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	|| (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_Cipher_Info()
{
	AI_Output (other, self, "DIA_Bodo_Cipher_15_00"); //Cipher mi ha detto che qualcuno gli ha rubato un pacco di erba di palude...
	AI_Output (self, other, "DIA_Bodo_Cipher_12_01"); //E allora?
	AI_Output (other, self, "DIA_Bodo_Cipher_15_02"); //Egli crede che sia stato tu a rubarlo.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_03"); //Oh, ECCO perché quel tizio mi guarda sempre con quell'espressione da ebete.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_04"); //Sono stato più che cordiale con lui ultimamente, perché sembra avere qualche problema.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_05"); //Ma non c'è stato niente da fare. Io lo fissavo con sguardo amichevole mentre lui mi guardava come se volesse uccidermi.
};

// ************************************************************
// 			  				  WeedOrElse
// ************************************************************
INSTANCE DIA_Bodo_WeedOrElse   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 5;
	condition   = DIA_Bodo_WeedOrElse_Condition;
	information = DIA_Bodo_WeedOrElse_Info;
	permanent   = FALSE;
	description = "Dammi quell’erba o sarà peggio per te!";
};
FUNC INT DIA_Bodo_WeedOrElse_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Bodo_Cipher))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_WeedOrElse_Info()
{
	AI_Output (other, self, "DIA_Bodo_WeedOrElse_15_00"); //Dammi quell’erba o sarà peggio per te!
	AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_01"); //Ascolta, tutto ciò che ho è questo sigaro d'erba di palude. Prenditelo e lasciami in pace.
	B_GiveInvItems (self, other, itmi_joint, 1);
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_02"); //Lo sai che i mercenari di Onar ci stanno cercando, vero?
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_03"); //Perciò non fare stupidaggini!
	};
};

// ************************************************************
// 			  				  WeedPERM
// ************************************************************
INSTANCE DIA_Bodo_WeedPERM   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 6;
	condition   = DIA_Bodo_WeedPERM_Condition;
	information = DIA_Bodo_WeedPERM_Info;
	permanent   = TRUE;
	description = "Non credo a una parola di ciò che stai dicendo. Dammi l’erba di palude!";
};
FUNC INT DIA_Bodo_WeedPERM_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Bodo_WeedOrElse))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_WeedPERM_Info()
{
	AI_Output (other, self, "DIA_Bodo_WeedPERM_15_00"); //Non credo a una parola di ciò che stai dicendo. Dammi l’erba di palude!
	AI_Output (self, other, "DIA_Bodo_WeedPERM_12_01"); //Non ce l'ho io. È la verità.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bodo_PICKPOCKET (C_INFO)
{
	npc			= BAU_903_Bodo;
	nr			= 900;
	condition	= DIA_Bodo_PICKPOCKET_Condition;
	information	= DIA_Bodo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bodo_PICKPOCKET_Condition()
{
	C_Beklauen (30, 60);
};
 
FUNC VOID DIA_Bodo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bodo_PICKPOCKET);
	Info_AddChoice		(DIA_Bodo_PICKPOCKET, DIALOG_BACK 		,DIA_Bodo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bodo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bodo_PICKPOCKET_DoIt);
};

func void DIA_Bodo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bodo_PICKPOCKET);
};
	
func void DIA_Bodo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bodo_PICKPOCKET);
};













