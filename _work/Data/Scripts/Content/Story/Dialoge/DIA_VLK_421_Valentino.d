///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Valentino_EXIT   (C_INFO)
{
	npc         = VLK_421_Valentino;
	nr          = 999;
	condition   = DIA_Valentino_EXIT_Condition;
	information = DIA_Valentino_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Valentino_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Valentino_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Valentino_HALLO		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 1;
	condition	= DIA_Valentino_HALLO_Condition;
	information	= DIA_Valentino_HALLO_Info;
	permanent 	= FALSE;
	description	= "Vaya, ¿qué tenemos aquí?";
};

func int DIA_Valentino_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Valentino_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Valentino_HALLO_15_00"); //Vaya, ¿qué tenemos aquí?
	//AI_Output (other, self, "DIA_Valentino_Add_15_00"); //Hey, wer bist du denn?
	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_01"); //Me llamo Valentino. Estoy intentando no profanar, trabajando, este día que me ha concedido Innos.
		AI_Output			(other, self, "DIA_Valentino_HALLO_15_02"); //Modera tu lenguaje.
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_03"); //Oh, perdóname, no pretendía ofender a nuestro señor. Perdóname, señor.
	}
	else
	{
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_04"); //¿No tienes modales? ¡Qué desagradable!
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_05"); //Siempre esta cháchara inmunda. ¿No tienes un trabajo en el que debas estar?
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_06"); //Pero supongo que nadie echaría de menos a un tiparraco como tú, ¿no?
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_07"); //Bueno, si tuvieras tanto oro como yo, tampoco tendrías que trabajar. Pero tú nunca serás tan rico.
		AI_Output			(other, self, "DIA_Valentino_HALLO_15_08"); //Veo que me lo voy a pasar muy bien contigo.
	};
};

// ********************************************************
// 						WhoAgain
// ********************************************************

instance DIA_Valentino_WhoAgain		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 2;
	condition	= DIA_Valentino_WhoAgain_Condition;
	information	= DIA_Valentino_WhoAgain_Info;
	permanent 	= FALSE;
	description	= "¡Te he preguntado quién eres!";
};

func int DIA_Valentino_WhoAgain_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Valentino_HALLO))
	&& (other.guild != GIL_KDF)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Valentino_WhoAgain_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_01"); //¡Te he preguntado quién eres!
	//AI_Output			(other, self, "DIA_Valentino_HALLO_wasmachstdu_15_00"); //Was macht jemand wie du in der Stadt?
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_01"); //Soy Valentino el guapo. Vividor y hombre de mujeres.
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_02"); //Pobre en preocupaciones, rico en dinero y sabiduría, y las mujeres se lanzan a mis brazos.
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_03"); //Si tienes problemas, quédatelos. Yo no los necesito.
};

// ********************************************************
// 						Manieren
// ********************************************************

instance DIA_Valentino_Manieren		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 3;
	condition	= DIA_Valentino_Manieren_Condition;
	information	= DIA_Valentino_Manieren_Info;
	permanent 	= FALSE;
	description	= "¡Parece que tendré que enseñarte modales!";
};

func int DIA_Valentino_Manieren_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Valentino_HALLO))
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Valentino_Manieren_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_02"); //¡Parece que tendré que enseñarte modales!
	//AI_Output			(other, self, "DIA_Valentino_HALLO_klappe_15_00"); //Für deine dünnen Ärmchen hast du 'ne ganz schön große Klappe!
	AI_Output			(self, other, "DIA_Valentino_HALLO_klappe_03_01"); //¡No me importa! Pégame todo lo que quieras. Cuando me levante mañana, volveré a estar bien.
	AI_Output			(self, other, "DIA_Valentino_HALLO_klappe_03_02"); //Pero tú tendrás que cargar toda la vida con esas jarras.
};

///////////////////////////////////////////////////////////////////////
//	Info Wasnuetzliches
///////////////////////////////////////////////////////////////////////

var int Valentino_Lo_Perm;
var int Valentino_Hi_Perm;
//---------------------------------------------------

instance DIA_Valentino_WASNUETZLICHES		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 4;
	condition	= DIA_Valentino_WASNUETZLICHES_Condition;
	information	= DIA_Valentino_WASNUETZLICHES_Info;
	permanent	= TRUE;
	description	= "¿Tienes algo más que decirme?";
};

func int DIA_Valentino_WASNUETZLICHES_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Valentino_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Valentino_WASNUETZLICHES_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_03"); //(Con calma) ¿Tienes algo más que decirme?
	//AI_Output			(other, self, "DIA_Valentino_WASNUETZLICHES_15_00"); //Kannst du mir was Nützliches über die Stadt erzählen?
	
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
	}
	else if (Valentino_Lo_Perm == FALSE)
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_01"); //Hazte popular, no prometas nunca nada a nadie, coge lo que puedas y ten cuidado y no te metas en peleas con la milicia.
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_02"); //O con maridos celosos, naturalmente. Permíteme decirte que son lo peor.
		Valentino_Lo_Perm = TRUE;
	}
	else if (Valentino_Hi_Perm == FALSE)
	&& ( (other.guild == GIL_PAL) || (other.guild == GIL_KDF) )
	{
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_03"); //Para un hombre de tu posición, cualquier cosa es posible. Solo tienes que reconocer cuándo es el momento de actuar.
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_04"); //Así que no pierdas ni un momento y actúa.
		Valentino_Hi_Perm = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Valentino_WASNUETZLICHES_03_05"); //Te he dicho todo lo que debes saber. El resto depende de ti.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Valentino_PICKPOCKET (C_INFO)
{
	npc			= VLK_421_Valentino;
	nr			= 900;
	condition	= DIA_Valentino_PICKPOCKET_Condition;
	information	= DIA_Valentino_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Sería sencillo robar su llave)";
};                       

FUNC INT DIA_Valentino_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_Valentino) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Valentino_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Valentino_PICKPOCKET);
	Info_AddChoice		(DIA_Valentino_PICKPOCKET, DIALOG_BACK 		,DIA_Valentino_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Valentino_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Valentino_PICKPOCKET_DoIt);
};

func void DIA_Valentino_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems (self, other, ItKe_Valentino, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Valentino_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); 
	};
};
	
func void DIA_Valentino_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Valentino_PICKPOCKET);
};




