
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Canthar_PICKPOCKET (C_INFO)
{
	npc			= VLK_468_Canthar;
	nr			= 900;
	condition	= DIA_Canthar_PICKPOCKET_Condition;
	information	= DIA_Canthar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Canthar_PICKPOCKET_Condition()
{
	C_Beklauen (20, 25);
};
 
FUNC VOID DIA_Canthar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Canthar_PICKPOCKET);
	Info_AddChoice		(DIA_Canthar_PICKPOCKET, DIALOG_BACK 		,DIA_Canthar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Canthar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Canthar_PICKPOCKET_DoIt);
};

func void DIA_Canthar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Canthar_PICKPOCKET);
};
	
func void DIA_Canthar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Canthar_PICKPOCKET);
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Canthar_EXIT(C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 999;
	condition	= DIA_Canthar_EXIT_Condition;
	information	= DIA_Canthar_EXIT_Info;
	permanent	= TRUE;
	description = "¡Tengo que irme!";
};                       

FUNC INT DIA_Canthar_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Canthar_EXIT_Info()
{
	AI_Output (other, self,"DIA_Canthar_EXIT_15_00"); //¡Tengo que irme!
	AI_Output (self, other,"DIA_Canthar_EXIT_09_01"); //Haz lo que quieras.
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  			Personal CRIMES
// ************************************************************

INSTANCE DIA_Canthar_PersonalCRIMES (C_INFO)
{
	npc			= VLK_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_PersonalCRIMES_Condition;
	information	= DIA_Canthar_PersonalCRIMES_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

func INT DIA_Canthar_PersonalCRIMES_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_LastFightComment] == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Canthar_PersonalCRIMES_Info()
{	
	// ------ Spieler hat mich besiegt ------
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_00"); //Fue una locura por tu parte atacarme.
	}
		
	// ------ ich habe Spieler besiegt ODER keiner wurde besiegt ------
	else // FIGHT_WON oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_01"); //(Mofándose) ¿Creías que podrías derrotarme tan fácilmente?
	};
	
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_02"); //¡O te disculpas por esto o haré que lamentes amargamente tu hazaña!
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_15_03"); //¿Y qué tenías en mente, exactamente?
	B_Say_Gold(self,other, 100);
	
	Info_ClearChoices	(DIA_Canthar_PersonalCRIMES);
	Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "¡No tengo tanto!"	,DIA_Canthar_PersonalCRIMES_NotEnough);
	if (Npc_HasItems (other, itmi_gold) >= 100)
	{
		Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "Aquí tienes tu oro, ¡olvidemos el asunto!",DIA_Canthar_PersonalCRIMES_Pay);
	};
};

func void DIA_Canthar_PersonalCRIMES_Pay()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_Pay_15_00"); //Aquí tienes tu oro, ¡olvidemos el asunto!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_Pay_09_01"); //¡Muy razonable por tu parte!
	
	// ------ AIVARs resetten! ------
	self.aivar[AIV_LastFightComment] = TRUE;
	
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_PersonalCRIMES_NotEnough()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00"); //¡No tengo tanto!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01"); //Entonces, ¿por qué malgastas mi tiempo?
	
	AI_StopProcessInfos(self);
};


// ************************************************************
// 			  				 Hallo 
// ************************************************************

INSTANCE DIA_Canthar_Hallo (C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_Hallo_Condition;
	information	= DIA_Canthar_Hallo_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Canthar_Hallo_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Canthar_Hallo_Info()
{	
	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	// ------ OHNE Rüstung ------
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_00"); //¿A quién tenemos aquí?
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_01"); //Vas de camino a la ciudad, ¿me equivoco?
		AI_Output	(other, self,"DIA_Canthar_Hallo_15_02"); //Tal vez.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_03"); //Mm... (Bufa) ¡Pareces un fugitivo! Todos los fugitivos se dirigen a la ciudad.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_04"); //Incluso podrías ser un ex-convicto de la colonia minera.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_05"); //(Con rapidez) No me importa de dónde vengas. Pero creo que tengo una oferta interesante para ti
		
		Canthar_GotMe = TRUE;
	}
	
	// ------ Bauernkleidung ------
	else if (Hlp_IsItem (itm, ItAr_Bau_L)) 
	|| 		(Hlp_IsItem (itm, ItAr_Bau_M))
	{
		AI_Output (self, other,"DIA_Canthar_HelloArmor_09_06");	//¿Cómo va el trabajo, campesino?
			
		Info_ClearChoices	(DIA_Canthar_Hallo);
		Info_AddChoice		(DIA_Canthar_Hallo, "¿Tengo aspecto de granjero?" 	,DIA_Canthar_Hallo_NoBauer);
		Info_AddChoice		(DIA_Canthar_Hallo, "No me puedo quejar."		,DIA_Canthar_Hallo_Bauer);
	}
	
	// ------ alle anderen Rüstungen (höchst unwahrscheinlich) ------
	else 
	{
		AI_Output (self, other,"DIA_Canthar_Hallo_09_07"); //¿Qué puedo hacer por ti?
	};
};

func void DIA_Canthar_Hallo_Bauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_Bauer_15_00");	//No me puedo quejar.
	AI_Output	(self, other,"DIA_Canthar_Hallo_Bauer_09_01");	//¿Puedo hacer algo por ti?

	Info_ClearChoices	(DIA_Canthar_Hallo);
};

func void DIA_Canthar_Hallo_NoBauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_NoBauer_15_00"); //¿Tengo aspecto de granjero?
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_01"); //Pareces un granjero. ¡Pero no hablas como uno!
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_02"); //(Pensativo) Si no estoy equivocado del todo, tengo una oferta interesante para ti...
	
	Canthar_GotMe = TRUE;
	
	Info_ClearChoices	(DIA_Canthar_Hallo);
};


// ************************************************************
// 		  				 	WhatOffer				//E3
// ************************************************************

INSTANCE DIA_Canthar_WhatOffer (C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_WhatOffer_Condition;
	information	= DIA_Canthar_WhatOffer_Info;
	permanent	= FALSE;
	description	= "¿Qué puedes ofrecerme?";
};                       

FUNC INT DIA_Canthar_WhatOffer_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Canthar_Hallo))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Canthar_WhatOffer_Info()
{	
	AI_Output (other, self,"DIA_Canthar_WhatOffer_15_00"); //¿Qué puedes ofrecerme?
	
	if (Canthar_GotME == TRUE)
	{
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_01"); //Con el aspecto que tienes, los guardias nunca te dejarán entrar en la ciudad.
		}
		else
		{
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_02"); //(Irónico) Si eres tan ''convincente'' con los guardias de la puerta como lo eres conmigo, nunca te dejarán entrar en la ciudad.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_03"); //Yo puedo ayudarte a entrar en la ciudad.
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_04"); //Aquí tengo un papelito. Con el sello real y la firma del gobernador. Un pase.
				
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_05"); //Con este trozo de papel en tu bolsillo, puedes tener la pinta asquerosa que quieras, y los guardias te dejarán tranquilo.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_06"); //¿Te interesa?
		
		Info_ClearChoices	(DIA_Canthar_WhatOffer);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "¡No! ¡Quédate con tu papel!",DIA_Canthar_WhatOffer_No);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "¿Qué quieres por tu pase?",DIA_Canthar_WhatOffer_Price);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "¿Y cómo entrarás TÚ en la ciudad?" 			,DIA_Canthar_WhatOffer_HowYouIn);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Debe haber algún truco..."	,DIA_Canthar_WhatOffer_Strings);
	}
	else
	{
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_07"); //Soy un comerciante viajero. Vendo un poco de todo.
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Canthar comercia con todo tipo de armas."); 
};

func void DIA_Canthar_WhatOffer_Strings()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Strings_15_00"); //Debe haber algún truco...
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Strings_09_01"); //(Exagerado) No. No hay trampa. Solo me deberás un favor.
};

func void DIA_Canthar_WhatOffer_HowYouIn()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");  //¿Y cómo entrarás TÚ en la ciudad?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_HowYouIn_09_01"); //Los guardias me conocen. Les diré simplemente que he perdido mi pase.
};

func void DIA_Canthar_WhatOffer_Price()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_00"); //¿Qué quieres por tu pase?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_01"); //(Complacido) ¡SABÍA que eras el hombre adecuado!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_02"); //Escucha. Te daré mi pase, ahora mismo.
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_03"); //¿Así como así?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_04"); //Exactamente. PERO si nos encontramos en la ciudad, me debes un favor.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_05"); //¿Trato hecho?
		
	Info_AddChoice (DIA_Canthar_WhatOffer, "Claro. Dame ese papel.",DIA_Canthar_WhatOffer_Ok);
};

func void DIA_Canthar_WhatOffer_Ok()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Ok_15_00"); //Claro. Dame ese papel.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_01"); //Toma. Cuidado con eso. Es muy valioso.
	CreateInvItems (self,ItWr_Passierschein, 1);
	B_GiveInvItems (self, other, ItWr_Passierschein, 1);
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_02"); //Una cosa más: ¡que no se te ocurra romper tu palabra!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_03"); //Como comerciante, tengo gran influencia en la ciudad. No sería bueno para ti, ¡créeme!
	
	Canthar_Gefallen = TRUE;	
	Info_ClearChoices	(DIA_Canthar_WhatOffer);
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"Tengo un pase de Canthar, el mercader, que me permite entrar en la ciudad. A cambio, le deberé un favor la próxima vez que nos veamos allí.");

};

func void DIA_Canthar_WhatOffer_No()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_No_15_00"); //¡No! ¡Quédate con tu papel!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_01"); //Mm. Creo que te he juzgado mal, ¿eh?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_02"); //Bueno. ¿Quieres algo más? ¿Puede interesarte mi mercancía?
	
	Info_ClearChoices	(DIA_Canthar_WhatOffer);
};


// ************************************************************
// 		  				 	TRADE				
// ************************************************************

instance DIA_Canthar_TRADE		(C_INFO)
{
	npc		 	= Vlk_468_Canthar;
	nr 			= 888;
	condition	= DIA_Canthar_TRADE_Condition;
	information	= DIA_Canthar_TRADE_Info;
	permanent	= TRUE;
	description	= "¡Enséñame tu mercancía!";
	trade		= TRUE;
};

func int DIA_Canthar_TRADE_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Canthar_WhatOffer))
	{
		return TRUE;
	};
};

func void DIA_Canthar_TRADE_Info ()
{
	AI_Output (other, self, "DIA_Canthar_TRADE_15_00"); //¡Enséñame tu mercancía!
	
	B_GiveTradeInv (self);
	
	AI_Output (self, other, "DIA_Canthar_TRADE_09_01"); //Elige tú mismo.
	
	
};



// ###########################################
// ###########################################

// 				In der Stadt 

// ###########################################
// ###########################################
/*
		-->
		Aber ein Händler namnes Canthar hat das erzählt. 
	*/

///////////////////////////////////////////////////////////////////////
//	Info PayPriceInCity
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_PAYPRICEINCITY		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_PAYPRICEINCITY_Condition;
	information	 = 	DIA_Canthar_PAYPRICEINCITY_Info;
	important	 = 	TRUE;
	permanent 	 =  FALSE;
};

func int DIA_Canthar_PAYPRICEINCITY_Condition ()
{
	if (Canthar_InStadt == TRUE)
	&& (Npc_IsDead(Sarah) == FALSE) 
	&& (Canthar_GotMe == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Canthar_PAYPRICEINCITY_Info ()
{
	if (Canthar_Gefallen == TRUE)
	{
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_00"); //Aún me debes un favor. Es hora de pagar tu deuda.
	}
	else
	{
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_01"); //Eh, tú, tengo una propuesta para ti.
	};
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_02"); //¿Qué es lo que quieres?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_03"); //Quiero recuperar mi antiguo puesto en el mercado. Sarah me lo quitó.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_04"); //Pero ella ya lleva bastante en ese sitio. Quiero que lo deje.
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_05"); //¿Y cuál es mi parte en esto?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_06"); //Te daré una carta para que se la metas en el bolsillo.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_07"); //Luego vas donde Andre y le dices que Sarah está vendiendo armas a Onar.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_08"); //Ella termina en prisión, tú te embolsas el botín y yo consigo el puesto.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_09"); //Tienes dos días para conseguirlo.
	
	if (Canthar_Gefallen == FALSE)
	{
		AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_10"); //¿Qué obtengo yo a cambio?
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_11"); //Cuando tenga el puesto, haré que consigas un arma. Y una especialmente buena.
	};
	
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "No, no quiero ser parte de esto.", DIA_Canthar_PAYPRICEINCITY_Nein );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "De acuerdo, lo haré.", DIA_Canthar_PAYPRICEINCITY_Ok );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "¿Qué ocurrirá si me niego a hacer eso?", DIA_Canthar_PAYPRICEINCITY_If );
};

func void DIA_Canthar_PAYPRICEINCITY_if ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_if_15_00"); //¿Qué ocurrirá si me niego a hacer eso?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_01"); //Eso sería realmente estúpido por tu parte. Porque sé que eres un convicto huido, ya ves...
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_02"); //Si eso se extiende, podría hacer un daño considerable a tu situación en la ciudad...
};

func void DIA_Canthar_PAYPRICEINCITY_Nein ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Nein_15_00"); //No, no quiero ser parte de esto.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Nein_09_01"); //Ha sido la decisión equivocada, chico. Ya hablaremos.
	
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog ();
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	
};

func void DIA_Canthar_PAYPRICEINCITY_Ok ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_00"); //De acuerdo, parece que no tengo elección.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_01"); //Eres un chico listo. Aquí está la carta.
	
	CreateInvItems (self, ItWr_Canthars_KomproBrief_MIS, 1);
	B_GiveInvItems (self, other, ItWr_Canthars_KomproBrief_MIS, 1);
	
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_02"); //¿Cómo se supone que voy a colarle la carta?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_03"); //Deja que te muestre su mercancía. Y, mientras lo hace, le escondes la carta.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_04"); //Y ten en cuenta que soy un hombre influyente en la ciudad, así que no intentes engañarme.
	
	MIS_Canthars_KomproBrief = LOG_RUNNING;
	MIS_Canthars_KomproBrief_Day = Wld_GetDay(); 
	
	Log_CreateTopic (TOPIC_Canthar,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Canthar,LOG_RUNNING);
	
	if (Canthar_Gefallen == TRUE)
	{
		B_LogEntry (TOPIC_Canthar,"Canthar quiere que le haga el favor que le debo.");
	}
	else
	{
		B_LogEntry (TOPIC_Canthar,"Canthar ha prometido darme un arma a cambio de que le haga un favor.");
	};
	B_LogEntry (TOPIC_Canthar,"Le voy a endosar una carta a Sarah, la mercader, que hará que parezca que vende armas a Onar. Entonces iré a lord André a delatarla.");
	
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	
};
///////////////////////////////////////////////////////////////////////
//	Info SarahErledigt
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_SARAHERLEDIGT		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_SARAHERLEDIGT_Condition;
	information	 = 	DIA_Canthar_SARAHERLEDIGT_Info;
	permanent	 =	TRUE;
	description	 = 	"Acerca de Sarah...";
};
func int DIA_Canthar_SARAHERLEDIGT_Condition ()
{
	if 	(MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Canthar_SARAHERLEDIGT_Info ()
{
	if ((Npc_IsDead(Sarah)) == FALSE)
	{
		if (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay()+ 2))
		{
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_00"); //¿No tienes nada que hacer?
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_01"); //Primero cuélale la carta a Sarah, luego ve donde Andre y acúsala...
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_02"); //Hazlo y no intentes timarme, o lo lamentarías.
		}
		else  
		{
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_03"); //Estás perdiendo el tiempo de que dispones. ¡Manos a la obra!
		};
	}
	else
	{
			AI_Output (other, self, "DIA_Canthar_SARAHERLEDIGT_15_04"); //Sarah está muerta.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_05"); //¿En serio? Genial. Entonces ya has completado tu mitad de nuestro pequeño trato.
			
			MIS_Canthars_KomproBrief = LOG_SUCCESS;
			B_GivePlayerXP (XP_Ambient);
			Npc_ExchangeRoutine	(self,"MARKTSTAND"); 
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Success		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_Success_Condition;
	information	 = 	DIA_Canthar_Success_Info;
	permanent	 =  FALSE;
	description	 = "Acerca de Sarah...";
};
func int DIA_Canthar_Success_Condition ()
{
	if (MIS_Canthars_KomproBrief == LOG_SUCCESS)
	&& ((Npc_IsDead(Sarah)) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Success_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Success_09_00"); //Bien hecho. Sarah está donde le corresponde.
	AI_Output (self, other, "DIA_Canthar_Success_09_01"); //Me he quedado con sus cosas, así que si necesitas un arma, ven a verme.
	
	if (Kapitel == 1)
	{
		CreateInvItems (self,ItMw_ShortSword3 , 1); 
		CreateInvItems (self,ItMw_ShortSword4 , 1);
		CreateInvItems (self,ItMw_ShortSword5 , 1);
		CreateInvItems (self,ItMw_Kriegshammer1, 1); 
		
		CreateInvItems (self, ItMw_1h_Vlk_Sword, 1); 
		CreateInvItems (self, ItMw_1h_Nov_Mace, 1); 
	};
	if (Kapitel == 2)
	{
		CreateInvItems (self,ItMw_Stabkeule , 1);
		CreateInvItems (self,ItMw_Steinbrecher, 1); 
		CreateInvItems (self,ItMw_Schwert2 , 1); 
		CreateInvItems (self,ItMw_Bartaxt , 1); 
	};
	
	if (Canthar_Gefallen == FALSE)
	{
		AI_Output (other, self, "DIA_Canthar_Success_15_02"); //Ibas a darme un arma.
		AI_Output (self, other, "DIA_Canthar_Success_09_03"); //Correcto. Toma, esta arma es una obra maestra del arte de la forja.
				
		B_GiveInvItems (self, other, ItMW_Schiffsaxt,1);
	};
	B_GivePlayerXP (XP_Canthars_KomproBrief);
};

//---------------------------------------------------------------------

				//Canthat hat seinen Marktstand OHNE Spieler Hilfe 

//---------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////
//	Info Canthar hat den Stand 
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Again		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_Again_Condition;
	information	 = 	DIA_Canthar_Again_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Canthar_Again_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&&  Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Again_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Again_09_00"); //Oh, aquí estás otra vez.
	
	if (MIS_Canthars_KomproBrief  == LOG_FAILED)
	{
		AI_Output (other,self , "DIA_Canthar_Again_15_01"); //¿Por qué no estás en la cárcel?
		AI_Output (self,other, "DIA_Canthar_Again_09_02"); //Me han soltado. Como ya te dije, soy un hombre influyente en la ciudad.
	}
	else if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_03"); //Mientras tanto, me he ocupado yo mismo de Sarah. Puedes olvidarte del asunto de la carta.
		
	}
	else if (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_04"); //¿No te avisé? Habría sido mejor si hubieras hecho lo que te dije.
	};
	AI_Output (self, other, "DIA_Canthar_Again_09_05"); //Ahora entre los comerciantes se rumorea que eres un convicto.
	AI_Output (self, other, "DIA_Canthar_Again_09_06"); //Un asunto lamentable. Ahora aquí en el mercado no podrás conseguir ni un trozo de pan.
	AI_Output (self, other, "DIA_Canthar_Again_09_07"); //Yo podría, naturalmente, arreglar las cosas para ti, digamos...
	B_Say_Gold 	(self, other, Canthar_Gold);
	
	AI_StopProcessInfos (self);
	
};

///////////////////////////////////////////////////////////////////////
//	Info Canthar bezahlen
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Pay		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_Pay_Condition;
	information	 = 	DIA_Canthar_Pay_Info;
	permanent	 =  TRUE;
	important 	 =  TRUE;
};

func int DIA_Canthar_Pay_Condition ()
{
	if Npc_KnowsInfo (other,DIA_Canthar_Again)
	&& (Canthar_Sperre == TRUE)
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Pay_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Pay_09_00"); //¿Has venido a pagar?
	
	Info_ClearChoices (DIA_Canthar_Pay);
	
	if (Npc_HasItems (other, ItmI_Gold) >= Canthar_Gold)
	{
		Info_AddChoice (DIA_Canthar_Pay,"De acuerdo, pagaré...",DIA_Canthar_Pay_Ja);
	};
	Info_AddChoice (DIA_Canthar_Pay,"No llevo encima suficiente dinero...",DIA_Canthar_Pay_Nein);
	Info_AddChoice (DIA_Canthar_Pay,"¿Dime otra vez cuánto era?",DIA_Canthar_Pay_Wieviel);
};


FUNC VOID DIA_Canthar_Pay_Ja()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Ja_15_00"); //De acuerdo, pagaré. No me dejas otra elección.
	B_GiveInvItems (other, self, Itmi_Gold,Canthar_Gold);
	AI_Output (self, other, "DIA_Canthar_Pay_Ja_09_01"); //(Sonríe) Bien. Entonces me ocuparé de que tu reputación entre los comerciantes sea restaurada.
	
	Canthar_Sperre = FALSE;
	Canthar_Pay = TRUE; 
	Info_ClearChoices (DIA_Canthar_Pay);
};
FUNC VOID DIA_Canthar_Pay_Nein()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Nein_15_00"); //No llevo mucho dinero encima...
	AI_Output (self, other, "DIA_Canthar_Pay_Nein_09_01"); //Pues búscalo.
	Info_ClearChoices (DIA_Canthar_Pay);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Canthar_Pay_Wieviel()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Wieviel_15_00"); //¿Dime otra vez cuánto era?
	B_Say_Gold 	(self, other, Canthar_Gold);
	
};
///////////////////////////////////////////////////////////////////////
//	Info Canthar im Knast
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_CANTHARANGEPISST		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_CANTHARANGEPISST_Condition;
	information	 = 	DIA_Canthar_CANTHARANGEPISST_Info;
	important	 = 	TRUE;
	permanent	 =  TRUE;
};
func int DIA_Canthar_CANTHARANGEPISST_Condition ()
{
	if (Canthar_Ausgeliefert == TRUE)  //SC hat Canthar bei Andre verpfiffen!
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000)
	&& Npc_IsInState  (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_CANTHARANGEPISST_Info ()
{
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_00"); //Ya te avisé, pero no hiciste caso. Hablaremos de esto más tarde.
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_01"); //Ahora piérdete. Quiero descansar.
	
	AI_StopProcessInfos (self);	
};
///////////////////////////////////////////////////////////////////////
//	Info MinenAnteil
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_MinenAnteil		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 = 	3;
	condition	 = 	DIA_Canthar_MinenAnteil_Condition;
	information	 = 	DIA_Canthar_MinenAnteil_Info;

	description	 = 	"¡Estás vendiendo participaciones de la mina ilegales!";
};

func int DIA_Canthar_MinenAnteil_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Canthar_WhatOffer))
		{
				return TRUE;
		};
};

func void DIA_Canthar_MinenAnteil_Info ()
{
	AI_Output (other, self, "DIA_Canthar_Minenanteil_15_00"); //¡Estás vendiendo participaciones de mina ilegales!
	AI_Output (self, other, "DIA_Canthar_Minenanteil_09_01"); //Sí, ¿y? ¡Qué pasa! Si no lo hago yo, otra persona lo hará.
	B_GivePlayerXP (XP_Ambient);
};











