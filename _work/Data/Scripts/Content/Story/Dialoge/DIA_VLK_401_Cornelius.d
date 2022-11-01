//*********************************************************************
//	Info EXIT 
//********************************************************************
INSTANCE DIA_Cornelius_Exit   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 999;
	condition   = DIA_Cornelius_Exit_Condition;
	information = DIA_Cornelius_Exit_Info;
	permanent   = TRUE;
	description	= DIALOG_ENDE;
};

FUNC INT DIA_Cornelius_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cornelius_Exit_Info()
{
	AI_StopProcessInfos (self);
};

//############################
//##						##			
//##		Kapitel 3		##
//##						##
//############################

//*********************************************************************
//	SeeMurder 
//********************************************************************
INSTANCE DIA_Cornelius_SeeMurder   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 4;
	condition   = DIA_Cornelius_SeeMurder_Condition;
	information = DIA_Cornelius_SeeMurder_Info;
	permanent   = FALSE;
	description	= "Viste el asesinato de Lothar, ¿no?";
};

FUNC INT DIA_Cornelius_SeeMurder_Condition()
{
	if (RecueBennet_KnowsCornelius == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_SeeMurder_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_SeeMurder_15_00"); //Viste el asesinato de Lothar, ¿no?
	AI_Output (self ,other,"DIA_Cornelius_SeeMurder_13_01"); //(Nervioso) No tengo por qué responder a ninguna pregunta sobre una investigación en curso.
	AI_Output (self ,other,"DIA_Cornelius_SeeMurder_13_02"); //Lord Hagen ya ha escuchado todo lo que sé.
};

//*********************************************************************
//	Was hast du gesehen? 
//********************************************************************
INSTANCE DIA_Cornelius_WhatYouSee   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 5;
	condition   = DIA_Cornelius_WhatYouSee_Condition;
	information = DIA_Cornelius_WhatYouSee_Info;
	permanent   = FALSE;
	description	= "¿Qué fue lo que viste?";
};

FUNC INT DIA_Cornelius_WhatYouSee_Condition()
{
	if Npc_KnowsInfo (other,DIA_Cornelius_SeeMurder)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_WhatYouSee_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_WhatYouSee_15_00"); //¿Qué fue lo que viste?
	AI_Output (self ,other,"DIA_Cornelius_WhatYouSee_13_01"); //(Frenéticamente) En serio, ahora no tengo tiempo.
	AI_Output (self ,other,"DIA_Cornelius_WhatYouSee_13_02"); //(Frenéticamente) Tienes que irte ya, la oficina va a cerrar.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius no quiere hablar conmigo."); 
	
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Jetzt reicht es! Was hast du gesehen?
//********************************************************************
INSTANCE DIA_Cornelius_Enough   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 6;
	condition   = DIA_Cornelius_Enough_Condition;
	information = DIA_Cornelius_Enough_Info;
	permanent   = FALSE;
	description	= "¡Ya basta! ¿Qué viste?";
};

FUNC INT DIA_Cornelius_Enough_Condition()
{
	if Npc_KnowsInfo (other,DIA_Cornelius_WhatYouSee)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_Enough_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_Enough_15_00"); //¡Ya basta! ¿Qué viste?
	AI_Output (self ,other,"DIA_Cornelius_Enough_13_01"); //(Nervioso) Yo... vi cómo el mercenario golpeó al paladín por detrás.
	AI_Output (self ,other,"DIA_Cornelius_Enough_13_02"); //(Nervioso) Y luego cogió su espada y se la clavó en el pecho.
	AI_Output (other,self ,"DIA_Cornelius_Enough_15_03"); //¿Estás totalmente seguro?
	AI_Output (self ,other,"DIA_Cornelius_Enough_13_04"); //(Asustado) Sí, por supuesto. Lo vi con mis propios ojos.
	AI_Output (self ,other,"DIA_Cornelius_Enough_13_05"); //(Asustado) Pero ahora no tengo tiempo, de verdad, tengo un montón de papeleo que hacer.

	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Ich glaube dir nicht.
//********************************************************************
INSTANCE DIA_Cornelius_DontBelieveYou   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 4;
	condition   = DIA_Cornelius_DontBelieveYou_Condition;
	information = DIA_Cornelius_DontBelieveYou_Info;
	permanent   = TRUE;
	description	= "No te creo.";
};

FUNC INT DIA_Cornelius_DontBelieveYou_Condition()
{
	if Npc_KnowsInfo (other,DIA_Cornelius_Enough)
	&& Cornelius_TellTruth != TRUE
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_DontBelieveYou_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_15_00"); //No te creo.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_13_01"); //(Confiado) Y qué, ¿vas a hacer algo al respecto?

	Info_ClearChoices (DIA_Cornelius_DontBelieveYou);
	//hier fehlt noch Taschendiebstahl
	Info_AddChoice (DIA_Cornelius_DontBelieveYou,"¿Qué pides a cambio?",DIA_Cornelius_DontBelieveYou_WhatYouWant);
	Info_AddChoice (DIA_Cornelius_DontBelieveYou,"Aprecias tu vida, ¿no?",DIA_Cornelius_DontBelieveYou_WantSurvive);
	
	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice (DIA_Cornelius_DontBelieveYou,"Podrían hacerte hablar en el monasterio.",DIA_Cornelius_DontBelieveYou_Monastery);
	};
	if (hero.guild == GIL_SLD)
	{
		Info_AddChoice (DIA_Cornelius_DontBelieveYou,"Podría decir a los mercenarios dónde vives.",DIA_Cornelius_DontBelieveYou_KnowYourHome);
	};
	if (hero.guild == GIL_MIL)
	{
		Info_AddChoice (DIA_Cornelius_DontBelieveYou,"El perjurio te llevará a la cárcel ¡durante mucho tiempo!",DIA_Cornelius_DontBelieveYou_Perjury);
	};
};

FUNC VOID DIA_Cornelius_DontBelieveYou_WhatYouWant ()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_00"); //¿Qué es lo que quieres?
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_01"); //(Arrogante) Ni siquiera tienes suficiente oro para pagarme.
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_02"); //¿Cuánto?
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_03"); //2000 monedas de oro. Bueno, eso podría hacerme considerar el asunto.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius estaría dispuesto a hablar conmigo, a cambio de 200 piezas de oro.");
	
	Cornelius_PayForProof = TRUE;
	Info_ClearChoices (DIA_Cornelius_DontBelieveYou);
};

FUNC VOID DIA_Cornelius_DontBelieveYou_WantSurvive ()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_WantSurvive_15_00"); //Aprecias tu vida, ¿no?
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_01"); //(Asustado) Si me atacas, te ahorcarán.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_02"); //Tengo amigos poderosos. Así que no te atrevas a ponerme un dedo encima.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_03"); //¡Sal de aquí o llamo a los guardias!
	
	
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Cornelius_DontBelieveYou_Monastery()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_Monastery_15_00"); //Podrían hacerte hablar en el monasterio.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_01"); //(Pálido como un muerto) ¿Qué quieres decir con eso?
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_Monastery_15_02"); //Bueno, tenemos métodos para obtener la verdad. Métodos dolorosos.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_03"); //No, por favor. Te diré todo lo que quieras.
	
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices (DIA_Cornelius_DontBelieveYou);
};

FUNC VOID DIA_Cornelius_DontBelieveYou_KnowYourHome()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_00"); //Podría decir a los mercenarios dónde vives.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_01"); //(Pálido como un muerto) ¿Qué se supone que quieres decir?
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_02"); //Apuesto a que se mueren por conocerte. No están nada contentos.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_03"); //No puedes hacer eso. Me matarían.
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_04"); //Es muy posible.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_05"); //Te diré lo que quieras, pero no hagas eso.
	
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices (DIA_Cornelius_DontBelieveYou);
};

FUNC VOID DIA_Cornelius_DontBelieveYou_Perjury()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_Perjury_15_00"); //El perjurio te llevará a la cárcel ¡durante mucho tiempo!
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_01"); //¿Intentas amenazarme? ¿Un centinela sin importancia está amenazándome?, ¿a mí, el secretario del gobernador?
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_02"); //Si no te esfumas ahora mismo, haré que te degraden.
	
	Cornelius_ThreatenByMilSC = TRUE;
	
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Hier ist das Geld
//********************************************************************
INSTANCE DIA_Cornelius_PayCornelius   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 4;
	condition   = DIA_Cornelius_PayCornelius_Condition;
	information = DIA_Cornelius_PayCornelius_Info;
	permanent   = TRUE;
	description	= "Aquí tienes el oro.";
};

FUNC INT DIA_Cornelius_PayCornelius_Condition()
{
	if Cornelius_PayForProof == TRUE
	&& (Npc_HasItems (other,ItMi_Gold) >= 2000)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_PayCornelius_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_PayCornelius_15_00"); //Aquí tienes el oro.
	
	B_GiveInvItems (other,self ,ItMi_Gold,2000);
	
	AI_Output (self ,other,"DIA_Cornelius_PayCornelius_13_01"); //Será mejor que no pregunte de dónde lo has sacado.
	AI_Output (self ,other,"DIA_Cornelius_PayCornelius_13_02"); //Para serte honesto, me da lo mismo.
	AI_Output (self ,other,"DIA_Cornelius_PayCornelius_13_03"); //Pero trato hecho.
	
	Cornelius_TellTruth = TRUE;
};


//*********************************************************************
//	Was ist wirklich passiert?
//********************************************************************
INSTANCE DIA_Cornelius_RealStory   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 4;
	condition   = DIA_Cornelius_RealStory_Condition;
	information = DIA_Cornelius_RealStory_Info;
	permanent   = TRUE;
	description	= "Entonces, ¿qué ocurrió de verdad?";
};

FUNC INT DIA_Cornelius_RealStory_Condition()
{
	if Cornelius_TellTruth == TRUE
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_RealStory_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_RealStory_15_00"); //Entonces, ¿qué ocurrió de verdad?
	AI_Output (self ,other,"DIA_Cornelius_RealStory_13_01"); //No vi lo que ocurrió. Recibí cierta cantidad por culpar a ese mercenario.
	AI_Output (self ,other,"DIA_Cornelius_RealStory_13_02"); //En estos tiempos, todo el mundo mira por sus asuntos. Necesitaba el dinero.
	AI_Output (other,self ,"DIA_Cornelius_RealStory_15_03"); //¿Quién te pagó?
	AI_Output (self ,other,"DIA_Cornelius_RealStory_13_04"); //Ya basta. Me matará si lo delato.
	AI_Output (other,self ,"DIA_Cornelius_RealStory_15_05"); //¿Estás preparado para contarle eso también a lord Hagen?
	AI_Output (self ,other,"DIA_Cornelius_RealStory_13_06"); //No estoy loco. Ahora no puedo quedarme en la ciudad.
	
	if (Npc_HasItems (self,ItWr_CorneliusTagebuch_Mis) >=1)
	{
		AI_Output (self ,other,"DIA_Cornelius_RealStory_13_07"); //Te daré mi diario. Debería ser prueba suficiente.
		B_GiveInvItems (self,other,ItWr_CorneliusTagebuch_Mis,1);
	};
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius mentía. Le pagaron para meter a Bennet entre rejas. Pero no me dirá quién le soborno. Está atemorizado.");
	
	CorneliusFlee = TRUE;
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"FLEE");
};


//*********************************************************************
//	Auf der Flucht
//********************************************************************
INSTANCE DIA_Cornelius_Fleeing (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 1;
	condition   = DIA_Cornelius_Fleeing_Condition;
	information = DIA_Cornelius_Fleeing_Info;
	permanent   = TRUE;
	important 	= TRUE;
};

FUNC INT DIA_Cornelius_Fleeing_Condition()
{
	if (CorneliusFlee == TRUE)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_Fleeing_Info()
{
	B_Say (self, other, "$NOTNOW");
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Cornelius_PICKPOCKET (C_INFO)
{
	npc			= VLK_401_Cornelius;
	nr			= 900;
	condition	= DIA_Cornelius_PICKPOCKET_Condition;
	information	= DIA_Cornelius_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Sería arriesgado robar este libro)";
};                       

FUNC INT DIA_Cornelius_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItWr_CorneliusTagebuch_Mis) >= 1)
	&&  (other.attribute[ATR_DEXTERITY] >= (60 - Theftdiff))
	
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cornelius_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Cornelius_PICKPOCKET);
	Info_AddChoice		(DIA_Cornelius_PICKPOCKET, DIALOG_BACK 		,DIA_Cornelius_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Cornelius_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Cornelius_PICKPOCKET_DoIt);
};

func void DIA_Cornelius_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 60)
	{
		B_GiveInvItems (self, other, ItWr_CorneliusTagebuch_Mis, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Cornelius_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Cornelius_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Cornelius_PICKPOCKET);
};
