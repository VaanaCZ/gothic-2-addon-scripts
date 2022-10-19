///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Halvor_EXIT   (C_INFO)
{
	npc         = VLK_469_Halvor;
	nr          = 999;
	condition   = DIA_Halvor_EXIT_Condition;
	information = DIA_Halvor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Halvor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Halvor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Halvor_PICKPOCKET (C_INFO)
{
	npc			= VLK_469_Halvor;
	nr			= 900;
	condition	= DIA_Halvor_PICKPOCKET_Condition;
	information	= DIA_Halvor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Halvor_PICKPOCKET_Condition()
{
	C_Beklauen (78, 150);
};
 
FUNC VOID DIA_Halvor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Halvor_PICKPOCKET);
	Info_AddChoice		(DIA_Halvor_PICKPOCKET, DIALOG_BACK 		,DIA_Halvor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Halvor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Halvor_PICKPOCKET_DoIt);
};

func void DIA_Halvor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Halvor_PICKPOCKET);
};
	
func void DIA_Halvor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Halvor_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info MESSAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_Hallo		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	2;
	condition	 = 	DIA_Halvor_Hallo_Condition;
	information	 = 	DIA_Halvor_Hallo_Info;
	permanent    =  FALSE;
	important	 =  TRUE;
};

func int DIA_Halvor_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Wld_IsTime (05,00,20,00))
	{
			return TRUE;
	};
};
func void DIA_Halvor_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Halvor_Hallo_06_00"); //Oye, ¿necesitas pescado? ¡Compra tu pescado aquí, directamente de las profundidades del mar!
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Halvor vende pescado en el puerto.");
};
///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_TRADE		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	2;
	condition	 = 	DIA_Halvor_TRADE_Condition;
	information	 = 	DIA_Halvor_TRADE_Info;
	permanent	 =  TRUE;
	trade		 =  TRUE;
	description	 = 	"Enséñame tu pescado.";
};

func int DIA_Halvor_TRADE_Condition ()
{
	if Npc_KnowsInfo (hero, DIA_Halvor_Hallo)
	&& (Wld_IsTime (05,00,20,00))
	&& (Halvor_Ausgeliefert == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Halvor_TRADE_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Halvor_TRADE_15_00"); //Enséñame tu pescado.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Night
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_Night		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	2;
	condition	 = 	DIA_Halvor_Night_Condition;
	information	 = 	DIA_Halvor_Night_Info;
	permanent	 =  TRUE;
	important 	 =  TRUE;
};
func int DIA_Halvor_Night_Condition ()
{
	if (Wld_IsTime (20,00,00,00))
	&& Npc_IsInState (self, ZS_Talk)
	&& (Halvor_Ausgeliefert == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Halvor_Night_Info ()
{
	AI_Output (self, other, "DIA_Halvor_Night_06_00"); //Eh, si quieres comprar pescado, ven a mi caseta mañana, ¿de acuerdo?
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Halvor_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_469_Halvor;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Halvor_MissingPeople_Condition;
	information	 = 	DIA_Addon_Halvor_MissingPeople_Info;

	description	 = 	"¿Puedes contarme algo sobre los desaparecidos?";
};

func int DIA_Addon_Halvor_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	&& (Halvor_Ausgeliefert == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Halvor_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Halvor_MissingPeople_15_00"); //¿Puedes contarme algo sobre los desaparecidos?
	AI_Output	(self, other, "DIA_Addon_Halvor_MissingPeople_06_01"); //¿Desaparecidos? Esto es un puerto, amigo. Esas cosas pueden pasar.
	AI_Output	(self, other, "DIA_Addon_Halvor_MissingPeople_06_02"); //El mar es traicionero y se cobra alguna vida de vez en cuando.
	AI_Output	(self, other, "DIA_Addon_Halvor_MissingPeople_06_03"); //Los capitanes de grandes navíos siempre contratan a nuevos marineros en puertos grandes como Khorinis para completar su tripulación.
	AI_Output	(self, other, "DIA_Addon_Halvor_MissingPeople_06_04"); //Y si no encuentran voluntarios, se llevan a gente en contra de su voluntad. Y luego se marchan.
	
	Info_ClearChoices	(DIA_Addon_Halvor_MissingPeople);
	Info_AddChoice	(DIA_Addon_Halvor_MissingPeople, DIALOG_BACK, DIA_Addon_Halvor_MissingPeople_Back );
	Info_AddChoice	(DIA_Addon_Halvor_MissingPeople, "¿De qué tipo de barco se trataría?", DIA_Addon_Halvor_MissingPeople_schiff );
	Info_AddChoice	(DIA_Addon_Halvor_MissingPeople, "¿Conoces a alguien que haya desaparecido?", DIA_Addon_Halvor_MissingPeople_wer );
	Info_AddChoice	(DIA_Addon_Halvor_MissingPeople, "¿Echas de menos a alguien?", DIA_Addon_Halvor_MissingPeople_you );
};
func void DIA_Addon_Halvor_MissingPeople_Back ()
{
	Info_ClearChoices	(DIA_Addon_Halvor_MissingPeople);
};
func void DIA_Addon_Halvor_MissingPeople_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Halvor_MissingPeople_wer_15_00"); //¿Conoces a alguien que haya desaparecido?
	AI_Output			(self, other, "DIA_Addon_Halvor_MissingPeople_wer_06_01"); //Ni idea. Pregunta en los astilleros.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Preguntar a los astilleros es el mejor consejo que el pescadero Halvor podía darme."); 
};
func void DIA_Addon_Halvor_MissingPeople_schiff ()
{
	AI_Output			(other, self, "DIA_Addon_Halvor_MissingPeople_schiff_15_00"); //¿De qué tipo de barco se trataría?
	AI_Output			(self, other, "DIA_Addon_Halvor_MissingPeople_schiff_06_01"); //Buena pregunta. Últimamente no llegan muchos barcos a Khorinis, eso es cierto.
};
func void DIA_Addon_Halvor_MissingPeople_you ()
{
	AI_Output			(other, self, "DIA_Addon_Halvor_MissingPeople_you_15_00"); //¿Echas de menos a alguien?
	AI_Output			(self, other, "DIA_Addon_Halvor_MissingPeople_you_06_01"); //¿Yo? No.
};

///////////////////////////////////////////////////////////////////////
//	Info MESSAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_MESSAGE		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	2;
	condition	 = 	DIA_Halvor_MESSAGE_Condition;
	information	 = 	DIA_Halvor_MESSAGE_Info;
	permanent    =  FALSE;
	description	 = 	"Creo que este trozo de papel te pertenece...";
	trade		 =  FALSE;
};

func int DIA_Halvor_MESSAGE_Condition ()
{	
	if (Knows_Halvor == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Halvor_MESSAGE_Info ()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_15_00"); //Creo que este trozo de papel te pertenece...
	AI_Output (self, other, "DIA_Halvor_MESSAGE_06_01"); //¿Qué...? Déjame verlo.
	B_UseFakeScroll 	();
	AI_Output (self, other, "DIA_Halvor_MESSAGE_06_02"); //(Sudando) Esto... Bueno, calmémonos. Esto... escucha. He revendido las cosas que obtuve de los bandidos.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_06_03"); //(Con rapidez) Pero no hay razón para llevar esto directo a la milicia, ¿no? Estoy seguro de que podemos llegar a un acuerdo, ¿verdad?
	
	Info_ClearChoices (DIA_Halvor_MESSAGE);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"Entonces, hazme una oferta.",DIA_Halvor_MESSAGE_OFFER);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"Creo que la cárcel te espera.",DIA_Halvor_MESSAGE_PRISON);

};
FUNC VOID DIA_Halvor_MESSAGE_OFFER()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_OFFER_15_00"); //Entonces, hazme una oferta.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_OFFER_06_01"); //De acuerdo. Te diré una cosa: puedo venderte algo más que simple pescado.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_OFFER_06_03"); //Si me das ese ridículo trozo de papel y, esto... olvidas el tema, tú y yo podemos convertirnos en grandes compañeros de negocios.
	
	Info_ClearChoices (DIA_Halvor_MESSAGE);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"De acuerdo, acepto.",DIA_Halvor_MESSAGE_Okay);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"Creo que la cárcel te espera.",DIA_Halvor_MESSAGE_PRISON);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"¿En serio? ¿Qué tipo de mercancía sería?",DIA_Halvor_MESSAGE_DEAL);
};	
FUNC VOID DIA_Halvor_MESSAGE_PRISON()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_PRISON_15_00"); //Creo que la cárcel te espera.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_PRISON_06_01"); //No, espera, ¡no puedes hacer eso! Después de todo, No soy más que... ya sabes... un don nadie.
	AI_Output (other, self, "DIA_Halvor_MESSAGE_PRISON_15_02"); //Deberías haberlo pensado antes. Ahora voy a informar sobre ti a lord Andre.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_PRISON_06_03"); //Lamentarás esto.
	
	Betrayal_Halvor = TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Halvor_MESSAGE_DEAL()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_DEAL_15_00"); //¿En serio? ¿Qué tipo de mercancía sería?
	AI_Output (self, other, "DIA_Halvor_MESSAGE_DEAL_06_01"); //Bueno, podría ofrecerte... pescado bastante especial, ya sabes. No solo el normal para comer.
	AI_Output (other, self, "DIA_Halvor_MESSAGE_DEAL_15_02"); //¿Quieres decir como el que contenía tu mensaje oculto?
	AI_Output (self, other, "DIA_Halvor_MESSAGE_DEAL_06_03"); //Eso es. Tengo varios de esos... pescados.
	
};
FUNC VOID DIA_Halvor_MESSAGE_Okay()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_Okay_15_00"); //De acuerdo. Trato hecho. Creo que podemos mantener este temita entre nosotros.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_Okay_06_01"); //Gracias. Déjate caer por aquí la próxima vez que andes por la zona. Seguro que tendré cosas interesantes para ti.
	
	B_GiveInvItems 	   (other, self, ItWr_HalvorMessage,1);
	Npc_RemoveInvItems (self, ItWr_HalvorMessage,1);
	
	Halvor_Deal = TRUE;
	Diebesgilde_Okay = (Diebesgilde_Okay + 1);
	//------------------------------------------------------
	CreateInvItems 	   (self,ItSe_ErzFisch , 1);
	CreateInvItems 	   (self,ItSe_GoldFisch, 1);
	CreateInvItems 	   (self,ItSe_Ringfisch , 1);
	CreateInvItems 	   (self,ItSe_LockpickFisch , 1);
	//------------------------------------------------------
	Info_ClearChoices (DIA_Halvor_MESSAGE);
};

///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Halvor_Zeichen   (C_INFO)
{
	npc         = VLK_469_Halvor;
	nr          = 2;
	condition   = DIA_Halvor_Zeichen_Condition;
	information = DIA_Halvor_Zeichen_Info;
	permanent   = FALSE;
	description = "(Hacer la señal de los ladrones)";
};

FUNC INT DIA_Halvor_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	&& (Betrayal_Halvor ==  FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Halvor_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	AI_Output (self, other, "DIA_Halvor_Zeichen_06_00");//Ya veo. No has venido solo a comprar pescado.
	AI_Output (self, other, "DIA_Halvor_Zeichen_06_01");//(Calmadamente) Te haré una oferta. Si tienes placas o cálices de plata, me los quedaré por un buen precio.
	
	CreateInvItems (self, ItKe_Lockpick, 20);
	
	Log_CreateTopic (Topic_Diebesgilde,LOG_NOTE);
	B_LogEntry (Topic_Diebesgilde,"Halvor comprará cálices y platos de plata a mejor precio que cualquier otro mercader.");
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Halvor_Hehlerei   (C_INFO)
{
	npc         = VLK_469_Halvor;
	nr          = 2;
	condition   = DIA_Halvor_Hehlerei_Condition;
	information = DIA_Halvor_Hehlerei_Info;
	permanent   = TRUE;
	description = "(Vender todas las bandejas y cálices)";
};

FUNC INT DIA_Halvor_Hehlerei_Condition()
{
	if Npc_KnowsInfo (other,DIA_Halvor_Zeichen)
	&& (Betrayal_Halvor == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Halvor_Hehlerei_Info()
{
	Halvor_Score = 0; //resetten
	
	if  (Halvor_Day != Wld_GetDay())
	{
		
		if (Npc_HasItems (other,ItMi_SilverPlate) >= 1)
		|| (Npc_HasItems (other,ItMi_SilverCup) >= 1)
		{
			Halvor_Score =  (Npc_HasItems (other,ItMi_SilverPlate) * (Value_SilverPlate/2)) + (Npc_HasItems (other,ItMi_SilverCup) * (Value_SilverCup/2));
			
			if (Halvor_Score <=  1000)  //weil sonst kein B_Say_Gold mehr...
			{
				AI_Output (self, other, "DIA_Halvor_Zeichen_06_05");//Por todas tus cosas te daré...
				B_Say_Gold (self, other, Halvor_Score);
			
				Info_ClearChoices (DIA_Halvor_Hehlerei);
				Info_AddChoice (DIA_Halvor_Hehlerei,"De acuerdo, vendido.",DIA_Halvor_Hehlerei_Annehmen);
				Info_AddChoice (DIA_Halvor_Hehlerei,"Me lo pensaré.",DIA_Halvor_Hehlerei_Ablehnen);
			}
			else 
			{
				AI_Output (self, other, "DIA_Halvor_Zeichen_06_06");//Trajiste demasiadas cosas. No puedo darte tanto oro de golpe.
				Info_ClearChoices (DIA_Halvor_Hehlerei);
			};
		}
		else 
		{
			AI_Output (self, other, "DIA_Halvor_Zeichen_06_02");//Regresa cuando tengas algunas placas o cálices de plata.
			Info_ClearChoices (DIA_Halvor_Hehlerei);
		};
	}
	else if (Wld_GetDay() == 0)
	{
		AI_Output (self, other, "DIA_Halvor_Zeichen_06_03");//Puedes librarte de tu plata aquí mañana. Hoy es demasiado pronto.
	}
	else 
	{
		AI_Output (self, other, "DIA_Halvor_Zeichen_06_04");//Lo siento, no más negocios por hoy. Regresa mañana, ¿vale?
	};

};
FUNC VOID DIA_Halvor_Hehlerei_Annehmen()
{
	/*
	CreateInvItems (other, ItRW_Arrow,(Npc_HasItems (other, ItMi_SilverPlate)+ Npc_HasItems (other, ItMi_SilverCup)));//Für Textausgabe -> ist ziemlich dreckig, aber wie sonst? 
	B_GiveInvItems (other, self, ItRW_Arrow,(Npc_HasItems (other, ItMi_SilverPlate)+ Npc_HasItems (other, ItMi_SilverCup)) ); 
 	*/
 	
 	//--------- Patch 2.5a-----------------------------------------
 	var int amount;
 	var string concatText;
 	amount = (Npc_HasItems (other, ItMi_SilverPlate)+ Npc_HasItems (other, ItMi_SilverCup)) ;
 	
 	concatText = ConcatStrings(IntToString(amount), PRINT_ItemsGegeben);
 	AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
 	
 	//------------------------------------------------------------
 	
 	Npc_RemoveInvItems (other, ItMi_SilverCup,Npc_HasItems (other, ItMi_SilverCup));
 	Npc_RemoveInvItems (other, ItMi_SilverPlate, Npc_HasItems (other, ItmI_SilverPlate));
 	
 	B_GiveInvItems (self, other, ItMi_Gold, Halvor_Score);
 	
 	AI_Output (other, self, "DIA_Halvor_Zeichen_Annehmen_15_00");//De acuerdo, vendido.
 	AI_Output (self, other, "DIA_Halvor_Zeichen_Annehmen_06_01");//Hemos hecho unos cuantos buenos tratos hoy. Mejor que no vuelvas hasta mañana o alguien podría sospechar, ¿entiendes?
	
	Halvor_Day = Wld_GetDay ();
	Info_ClearChoices (DIA_Halvor_Hehlerei);
}; 
FUNC VOID DIA_Halvor_Hehlerei_Ablehnen()
{
	Info_ClearChoices (DIA_Halvor_Hehlerei);
};

//#############################################
//##
//##	Kapitel 5
//##
//#############################################

///////////////////////////////////////////////////////////////////////
//	Info MESSAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_Crew		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	51;
	condition	 = 	DIA_Halvor_Crew_Condition;
	information	 = 	DIA_Halvor_Crew_Info;
	permanent    =  FALSE;
	description	 =  "Busco una tripulación.";
};

func int DIA_Halvor_Crew_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Halvor_Ausgeliefert == FALSE)
	{
			return TRUE;
	};
};
func void DIA_Halvor_Crew_Info ()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_15_00"); //Busco una tripulación.
	AI_Output (self ,other,"DIA_Halvor_Crew_06_01"); //¿Pero cómo esperas salir de aquí?
	
	Info_ClearChoices (DIA_Halvor_Crew);
	Info_AddChoice (DIA_Halvor_Crew,"Ése es mi problema.",DIA_Halvor_Crew_MyThing);
	Info_AddChoice (DIA_Halvor_Crew,"Voy a apropiarme de un barco.",DIA_Halvor_Crew_StealShip);
	
};

FUNC VOID DIA_Halvor_Crew_MyThing()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_MyThing_15_00"); //Ése es mi problema.
	AI_Output (self ,other,"DIA_Halvor_Crew_MyThing_06_01"); //Tú mismo. En realidad, no es mi problema.

	Info_ClearChoices (DIA_Halvor_Crew);
	Info_AddChoice (DIA_Halvor_Crew,DIALOG_BACK,DIA_Halvor_Crew_BACK);
	Info_AddChoice (DIA_Halvor_Crew,"¿Quieres venir?",DIA_Halvor_Crew_JoinMe);
	Info_AddChoice (DIA_Halvor_Crew,"¿Puedes ayudarme?",DIA_Halvor_Crew_HelpMe); 
};

FUNC VOID DIA_Halvor_Crew_StealShip()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_StealShip_15_00"); //Voy a apropiarme de un barco.
	AI_Output (self ,other,"DIA_Halvor_Crew_StealShip_06_01"); //Ya, seguro. ¿Vas en serio? Los paladines te harán picadillo cuando te pillen.
	AI_Output (self ,other,"DIA_Halvor_Crew_StealShip_06_02"); //Tú mismo. No es mi vida la que está en juego.
	
	Info_ClearChoices (DIA_Halvor_Crew);
	Info_AddChoice (DIA_Halvor_Crew,DIALOG_BACK,DIA_Halvor_Crew_BACK);
	Info_AddChoice (DIA_Halvor_Crew,"¿Quieres venir?",DIA_Halvor_Crew_JoinMe);
	if (Npc_IsDead (JACK) == FALSE)
	{
		Info_AddChoice (DIA_Halvor_Crew,"¿Puedes ayudarme?",DIA_Halvor_Crew_HelpMe); 
	};
};

FUNC VOID DIA_Halvor_Crew_JoinMe()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_JoinMe_15_00"); //¿Quieres venir?
	AI_Output (self ,other,"DIA_Halvor_Crew_JoinMe_06_01"); //Nooo, creo que no. Tengo bastante que hacer aquí y, honestamente, no tengo ganas de encontrarme con una galera de esclavos llena de orcos.
	AI_Output (self ,other,"DIA_Halvor_Crew_JoinMe_06_02"); //Pero te deseo mucha suerte.
};

FUNC VOID DIA_Halvor_Crew_HelpMe()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_HelpMe_15_00"); //¿Puedes ayudarme?
	AI_Output (self ,other,"DIA_Halvor_Crew_HelpMe_06_01"); //No soy la persona adecuada para eso. Pero ve a hablar con Jack. Él debería estar dando una vuelta por el puerto y sabrá mejor lo que necesitas para ese viaje.
};

FUNC VOID DIA_Halvor_Crew_Back()
{
	Info_ClearChoices (DIA_Halvor_Crew);
};




