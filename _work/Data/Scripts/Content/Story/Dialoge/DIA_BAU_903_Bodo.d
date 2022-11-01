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
	description = "¿Qué tal va todo?";
};
FUNC INT DIA_Bodo_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Hallo_Info()
{
	AI_Output (other, self, "DIA_Bodo_Hallo_15_00"); //¿Cómo va todo?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_01"); //La milicia se ha aprovechado de nosotros mucho tiempo, pero ahora que los mercenarios están en nuestro bando, no van a atreverse a aparecer.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_02"); //A lo mejor el rey cree que puede salirse con la suya, pero no vamos a permitírselo.
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_03"); //Bien. Si ves milicianos, dales una paliza de mi parte, ¿vale?
	};
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_04"); //Bien. Que Innos te acompañe.
	};
			
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{	
		AI_Output (self, other, "DIA_Bodo_Hallo_12_05"); //A las tropas del rey no se las recibe con los brazos abiertos en la granja.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_06"); //A lo mejor hay mucha gente que habla contigo, pero eso no quiere decir que seas popular.
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
	description = "En la ciudad se habla de una rebelión de los campesinos.";
};
FUNC INT DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bauernaufstand_15_00"); //En la ciudad se habla de una rebelión de los campesinos.
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_01"); //Tonterías. Solo defendemos aquello que nos ha costado tanto conseguir.
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_02"); //Es cierto que los campesinos soportan el peso de la guerra, pero Onar se ha hartado de mirar mientras el rey nos saca la sangre.
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
	description = "¿Puedo descansar en algún lugar?";
};
FUNC INT DIA_Bodo_Bett_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bett_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bett_15_00"); //¿Puedo descansar en algún lugar?
	AI_Output (self, other, "DIA_Bodo_Bett_12_01"); //Si buscas dónde dormir ve al granero, pero no te tumbes por error en la cama de un mercenario.
	AI_Output (self, other, "DIA_Bodo_Bett_12_02"); //Onar se asegura de que a los granjeros nos dejen en paz, pero los mercenarios pueden hacer lo que se les antoje a los extranjeros que no son de la granja.
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
	description = "Cipher me ha dicho que alguien le robó un paquete de hierba del pantano.";
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
	AI_Output (other, self, "DIA_Bodo_Cipher_15_00"); //Cipher me ha dicho que alguien le robó un paquete de hierba del pantano.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_01"); //¿Y?
	AI_Output (other, self, "DIA_Bodo_Cipher_15_02"); //Cree que fuiste tú.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_03"); //¿Ah sí? Por eso siempre se me queda mirando boquiabierto con gesto estúpido.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_04"); //Últimamente he sido muy amable con él, porque parece que lo está pasando mal.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_05"); //Pero no hay manera. Yo le lanzaba miradas cordiales y él parecía querer fulminarme con la mirada.
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
	description = "¡Como no me des la hierba, te vas a enterar!";
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
	AI_Output (other, self, "DIA_Bodo_WeedOrElse_15_00"); //¡Como no me des la hierba, te vas a enterar!
	AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_01"); //Mira, solo tengo este cigarro de hierba. Quédatelo y déjame en paz.
	B_GiveInvItems (self, other, itmi_joint, 1);
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_02"); //Sabes que los mercenarios de Onar nos defienden, ¿no?
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_03"); //¡Así que no cometas ninguna estupidez!
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
	description = "No me creo ni una palabra. ¡Dame la hierba del pantano!";
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
	AI_Output (other, self, "DIA_Bodo_WeedPERM_15_00"); //No me creo ni una palabra. ¡Dame la hierba del pantano!
	AI_Output (self, other, "DIA_Bodo_WeedPERM_12_01"); //No la tengo, de verdad.
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













