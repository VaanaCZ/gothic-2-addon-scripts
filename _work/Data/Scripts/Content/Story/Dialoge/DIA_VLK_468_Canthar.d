
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
	description = "�Tengo que irme!";
};                       

FUNC INT DIA_Canthar_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Canthar_EXIT_Info()
{
	AI_Output (other, self,"DIA_Canthar_EXIT_15_00"); //�Tengo que irme!
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
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_01"); //(Mof�ndose) �Cre�as que podr�as derrotarme tan f�cilmente?
	};
	
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_02"); //�O te disculpas por esto o har� que lamentes amargamente tu haza�a!
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_15_03"); //�Y qu� ten�as en mente, exactamente?
	B_Say_Gold(self,other, 100);
	
	Info_ClearChoices	(DIA_Canthar_PersonalCRIMES);
	Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "�No tengo tanto!"	,DIA_Canthar_PersonalCRIMES_NotEnough);
	if (Npc_HasItems (other, itmi_gold) >= 100)
	{
		Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "Aqu� tienes tu oro, �olvidemos el asunto!",DIA_Canthar_PersonalCRIMES_Pay);
	};
};

func void DIA_Canthar_PersonalCRIMES_Pay()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_Pay_15_00"); //Aqu� tienes tu oro, �olvidemos el asunto!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_Pay_09_01"); //�Muy razonable por tu parte!
	
	// ------ AIVARs resetten! ------
	self.aivar[AIV_LastFightComment] = TRUE;
	
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_PersonalCRIMES_NotEnough()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00"); //�No tengo tanto!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01"); //Entonces, �por qu� malgastas mi tiempo?
	
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
	
	// ------ OHNE R�stung ------
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_00"); //�A qui�n tenemos aqu�?
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_01"); //Vas de camino a la ciudad, �me equivoco?
		AI_Output	(other, self,"DIA_Canthar_Hallo_15_02"); //Tal vez.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_03"); //Mm... (Bufa) �Pareces un fugitivo! Todos los fugitivos se dirigen a la ciudad.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_04"); //Incluso podr�as ser un ex-convicto de la colonia minera.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_05"); //(Con rapidez) No me importa de d�nde vengas. Pero creo que tengo una oferta interesante para ti
		
		Canthar_GotMe = TRUE;
	}
	
	// ------ Bauernkleidung ------
	else if (Hlp_IsItem (itm, ItAr_Bau_L)) 
	|| 		(Hlp_IsItem (itm, ItAr_Bau_M))
	{
		AI_Output (self, other,"DIA_Canthar_HelloArmor_09_06");	//�C�mo va el trabajo, campesino?
			
		Info_ClearChoices	(DIA_Canthar_Hallo);
		Info_AddChoice		(DIA_Canthar_Hallo, "�Tengo aspecto de granjero?" 	,DIA_Canthar_Hallo_NoBauer);
		Info_AddChoice		(DIA_Canthar_Hallo, "No me puedo quejar."		,DIA_Canthar_Hallo_Bauer);
	}
	
	// ------ alle anderen R�stungen (h�chst unwahrscheinlich) ------
	else 
	{
		AI_Output (self, other,"DIA_Canthar_Hallo_09_07"); //�Qu� puedo hacer por ti?
	};
};

func void DIA_Canthar_Hallo_Bauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_Bauer_15_00");	//No me puedo quejar.
	AI_Output	(self, other,"DIA_Canthar_Hallo_Bauer_09_01");	//�Puedo hacer algo por ti?

	Info_ClearChoices	(DIA_Canthar_Hallo);
};

func void DIA_Canthar_Hallo_NoBauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_NoBauer_15_00"); //�Tengo aspecto de granjero?
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_01"); //Pareces un granjero. �Pero no hablas como uno!
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
	description	= "�Qu� puedes ofrecerme?";
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
	AI_Output (other, self,"DIA_Canthar_WhatOffer_15_00"); //�Qu� puedes ofrecerme?
	
	if (Canthar_GotME == TRUE)
	{
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_01"); //Con el aspecto que tienes, los guardias nunca te dejar�n entrar en la ciudad.
		}
		else
		{
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_02"); //(Ir�nico) Si eres tan ''convincente'' con los guardias de la puerta como lo eres conmigo, nunca te dejar�n entrar en la ciudad.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_03"); //Yo puedo ayudarte a entrar en la ciudad.
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_04"); //Aqu� tengo un papelito. Con el sello real y la firma del gobernador. Un pase.
				
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_05"); //Con este trozo de papel en tu bolsillo, puedes tener la pinta asquerosa que quieras, y los guardias te dejar�n tranquilo.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_06"); //�Te interesa?
		
		Info_ClearChoices	(DIA_Canthar_WhatOffer);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "�No! �Qu�date con tu papel!",DIA_Canthar_WhatOffer_No);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "�Qu� quieres por tu pase?",DIA_Canthar_WhatOffer_Price);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "�Y c�mo entrar�s T� en la ciudad?" 			,DIA_Canthar_WhatOffer_HowYouIn);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Debe haber alg�n truco..."	,DIA_Canthar_WhatOffer_Strings);
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
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Strings_15_00"); //Debe haber alg�n truco...
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Strings_09_01"); //(Exagerado) No. No hay trampa. Solo me deber�s un favor.
};

func void DIA_Canthar_WhatOffer_HowYouIn()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");  //�Y c�mo entrar�s T� en la ciudad?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_HowYouIn_09_01"); //Los guardias me conocen. Les dir� simplemente que he perdido mi pase.
};

func void DIA_Canthar_WhatOffer_Price()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_00"); //�Qu� quieres por tu pase?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_01"); //(Complacido) �SAB�A que eras el hombre adecuado!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_02"); //Escucha. Te dar� mi pase, ahora mismo.
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_03"); //�As� como as�?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_04"); //Exactamente. PERO si nos encontramos en la ciudad, me debes un favor.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_05"); //�Trato hecho?
		
	Info_AddChoice (DIA_Canthar_WhatOffer, "Claro. Dame ese papel.",DIA_Canthar_WhatOffer_Ok);
};

func void DIA_Canthar_WhatOffer_Ok()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Ok_15_00"); //Claro. Dame ese papel.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_01"); //Toma. Cuidado con eso. Es muy valioso.
	CreateInvItems (self,ItWr_Passierschein, 1);
	B_GiveInvItems (self, other, ItWr_Passierschein, 1);
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_02"); //Una cosa m�s: �que no se te ocurra romper tu palabra!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_03"); //Como comerciante, tengo gran influencia en la ciudad. No ser�a bueno para ti, �cr�eme!
	
	Canthar_Gefallen = TRUE;	
	Info_ClearChoices	(DIA_Canthar_WhatOffer);
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"Tengo un pase de Canthar, el mercader, que me permite entrar en la ciudad. A cambio, le deber� un favor la pr�xima vez que nos veamos all�.");

};

func void DIA_Canthar_WhatOffer_No()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_No_15_00"); //�No! �Qu�date con tu papel!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_01"); //Mm. Creo que te he juzgado mal, �eh?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_02"); //Bueno. �Quieres algo m�s? �Puede interesarte mi mercanc�a?
	
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
	description	= "�Ens��ame tu mercanc�a!";
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
	AI_Output (other, self, "DIA_Canthar_TRADE_15_00"); //�Ens��ame tu mercanc�a!
	
	B_GiveTradeInv (self);
	
	AI_Output (self, other, "DIA_Canthar_TRADE_09_01"); //Elige t� mismo.
	
	
};



// ###########################################
// ###########################################

// 				In der Stadt 

// ###########################################
// ###########################################
/*
		-->
		Aber ein H�ndler namnes Canthar hat das erz�hlt. 
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
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_00"); //A�n me debes un favor. Es hora de pagar tu deuda.
	}
	else
	{
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_01"); //Eh, t�, tengo una propuesta para ti.
	};
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_02"); //�Qu� es lo que quieres?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_03"); //Quiero recuperar mi antiguo puesto en el mercado. Sarah me lo quit�.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_04"); //Pero ella ya lleva bastante en ese sitio. Quiero que lo deje.
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_05"); //�Y cu�l es mi parte en esto?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_06"); //Te dar� una carta para que se la metas en el bolsillo.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_07"); //Luego vas donde Andre y le dices que Sarah est� vendiendo armas a Onar.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_08"); //Ella termina en prisi�n, t� te embolsas el bot�n y yo consigo el puesto.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_09"); //Tienes dos d�as para conseguirlo.
	
	if (Canthar_Gefallen == FALSE)
	{
		AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_10"); //�Qu� obtengo yo a cambio?
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_11"); //Cuando tenga el puesto, har� que consigas un arma. Y una especialmente buena.
	};
	
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "No, no quiero ser parte de esto.", DIA_Canthar_PAYPRICEINCITY_Nein );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "De acuerdo, lo har�.", DIA_Canthar_PAYPRICEINCITY_Ok );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "�Qu� ocurrir� si me niego a hacer eso?", DIA_Canthar_PAYPRICEINCITY_If );
};

func void DIA_Canthar_PAYPRICEINCITY_if ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_if_15_00"); //�Qu� ocurrir� si me niego a hacer eso?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_01"); //Eso ser�a realmente est�pido por tu parte. Porque s� que eres un convicto huido, ya ves...
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_02"); //Si eso se extiende, podr�a hacer un da�o considerable a tu situaci�n en la ciudad...
};

func void DIA_Canthar_PAYPRICEINCITY_Nein ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Nein_15_00"); //No, no quiero ser parte de esto.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Nein_09_01"); //Ha sido la decisi�n equivocada, chico. Ya hablaremos.
	
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog ();
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	
};

func void DIA_Canthar_PAYPRICEINCITY_Ok ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_00"); //De acuerdo, parece que no tengo elecci�n.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_01"); //Eres un chico listo. Aqu� est� la carta.
	
	CreateInvItems (self, ItWr_Canthars_KomproBrief_MIS, 1);
	B_GiveInvItems (self, other, ItWr_Canthars_KomproBrief_MIS, 1);
	
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_02"); //�C�mo se supone que voy a colarle la carta?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_03"); //Deja que te muestre su mercanc�a. Y, mientras lo hace, le escondes la carta.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_04"); //Y ten en cuenta que soy un hombre influyente en la ciudad, as� que no intentes enga�arme.
	
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
	B_LogEntry (TOPIC_Canthar,"Le voy a endosar una carta a Sarah, la mercader, que har� que parezca que vende armas a Onar. Entonces ir� a lord Andr� a delatarla.");
	
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
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_00"); //�No tienes nada que hacer?
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_01"); //Primero cu�lale la carta a Sarah, luego ve donde Andre y ac�sala...
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_02"); //Hazlo y no intentes timarme, o lo lamentar�as.
		}
		else  
		{
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_03"); //Est�s perdiendo el tiempo de que dispones. �Manos a la obra!
		};
	}
	else
	{
			AI_Output (other, self, "DIA_Canthar_SARAHERLEDIGT_15_04"); //Sarah est� muerta.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_05"); //�En serio? Genial. Entonces ya has completado tu mitad de nuestro peque�o trato.
			
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
	AI_Output (self, other, "DIA_Canthar_Success_09_00"); //Bien hecho. Sarah est� donde le corresponde.
	AI_Output (self, other, "DIA_Canthar_Success_09_01"); //Me he quedado con sus cosas, as� que si necesitas un arma, ven a verme.
	
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
	AI_Output (self, other, "DIA_Canthar_Again_09_00"); //Oh, aqu� est�s otra vez.
	
	if (MIS_Canthars_KomproBrief  == LOG_FAILED)
	{
		AI_Output (other,self , "DIA_Canthar_Again_15_01"); //�Por qu� no est�s en la c�rcel?
		AI_Output (self,other, "DIA_Canthar_Again_09_02"); //Me han soltado. Como ya te dije, soy un hombre influyente en la ciudad.
	}
	else if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_03"); //Mientras tanto, me he ocupado yo mismo de Sarah. Puedes olvidarte del asunto de la carta.
		
	}
	else if (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_04"); //�No te avis�? Habr�a sido mejor si hubieras hecho lo que te dije.
	};
	AI_Output (self, other, "DIA_Canthar_Again_09_05"); //Ahora entre los comerciantes se rumorea que eres un convicto.
	AI_Output (self, other, "DIA_Canthar_Again_09_06"); //Un asunto lamentable. Ahora aqu� en el mercado no podr�s conseguir ni un trozo de pan.
	AI_Output (self, other, "DIA_Canthar_Again_09_07"); //Yo podr�a, naturalmente, arreglar las cosas para ti, digamos...
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
	AI_Output (self, other, "DIA_Canthar_Pay_09_00"); //�Has venido a pagar?
	
	Info_ClearChoices (DIA_Canthar_Pay);
	
	if (Npc_HasItems (other, ItmI_Gold) >= Canthar_Gold)
	{
		Info_AddChoice (DIA_Canthar_Pay,"De acuerdo, pagar�...",DIA_Canthar_Pay_Ja);
	};
	Info_AddChoice (DIA_Canthar_Pay,"No llevo encima suficiente dinero...",DIA_Canthar_Pay_Nein);
	Info_AddChoice (DIA_Canthar_Pay,"�Dime otra vez cu�nto era?",DIA_Canthar_Pay_Wieviel);
};


FUNC VOID DIA_Canthar_Pay_Ja()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Ja_15_00"); //De acuerdo, pagar�. No me dejas otra elecci�n.
	B_GiveInvItems (other, self, Itmi_Gold,Canthar_Gold);
	AI_Output (self, other, "DIA_Canthar_Pay_Ja_09_01"); //(Sonr�e) Bien. Entonces me ocupar� de que tu reputaci�n entre los comerciantes sea restaurada.
	
	Canthar_Sperre = FALSE;
	Canthar_Pay = TRUE; 
	Info_ClearChoices (DIA_Canthar_Pay);
};
FUNC VOID DIA_Canthar_Pay_Nein()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Nein_15_00"); //No llevo mucho dinero encima...
	AI_Output (self, other, "DIA_Canthar_Pay_Nein_09_01"); //Pues b�scalo.
	Info_ClearChoices (DIA_Canthar_Pay);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Canthar_Pay_Wieviel()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Wieviel_15_00"); //�Dime otra vez cu�nto era?
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
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_00"); //Ya te avis�, pero no hiciste caso. Hablaremos de esto m�s tarde.
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_01"); //Ahora pi�rdete. Quiero descansar.
	
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

	description	 = 	"�Est�s vendiendo participaciones de la mina ilegales!";
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
	AI_Output (other, self, "DIA_Canthar_Minenanteil_15_00"); //�Est�s vendiendo participaciones de mina ilegales!
	AI_Output (self, other, "DIA_Canthar_Minenanteil_09_01"); //S�, �y? �Qu� pasa! Si no lo hago yo, otra persona lo har�.
	B_GivePlayerXP (XP_Ambient);
};











