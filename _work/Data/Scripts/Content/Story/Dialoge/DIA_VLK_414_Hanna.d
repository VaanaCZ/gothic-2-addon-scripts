// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Hanna_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_EXIT_Condition;
	information	= DIA_Hanna_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Hanna_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hanna_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Hanna_Hello(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Hello_Condition;
	information	= DIA_Hanna_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Hanna_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Hanna_Hello_17_00"); //Ah, un cliente. ¿Qué puedo hacer por ti?
};	

//*****************************************
//	Ich suche ein Zimmer
//*****************************************
INSTANCE DIA_Hanna_Room(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 2;
	condition	= DIA_Hanna_Room_Condition;
	information	= DIA_Hanna_Room_Info;
	permanent	= FALSE;
	description	= "Busco una habitación.";
};                       

FUNC INT DIA_Hanna_Room_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Room_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_Room_15_00"); //Busco una habitación.
	AI_Output (self ,other,"DIA_Hanna_Room_17_01"); //Entonces estás en el sitio adecuado.
	if (Npc_KnowsInfo (other, DIA_Lothar_Schlafen))
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_03"); //Uno de los paladines me dijo que podía pasar la noche aquí gratis...
	}
	else
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_00"); //¿Cuánto cuesta pasar la noche?
		AI_Output (self, other, "DIA_Hanna_Add_17_01"); //Absolutamente nada.
		AI_Output (self, other, "DIA_Hanna_Add_17_02"); //Los paladines son los responsables de alojar a todos los viajeros.
		AI_Output (other, self, "DIA_Hanna_Add_15_04"); //Entonces, ¿puedo pasar aquí la noche gratis?
	};
	
	AI_Output (self, other, "DIA_Hanna_Add_17_05"); //Sí, sí.
	AI_Output (self, other, "DIA_Hanna_Add_17_06"); //Sube por las escaleras.
	AI_Output (self, other, "DIA_Hanna_Add_17_07"); //Aún tenemos un par de camas libres.
	//AI_Output (self ,other,"DIA_Hanna_Room_17_02"); //Geh einfach nach oben und suche dir ein Bett.
};

//*****************************************
//	WhyPay
//*****************************************
INSTANCE DIA_Hanna_WhyPay(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 3;
	condition	= DIA_Hanna_WhyPay_Condition;
	information	= DIA_Hanna_WhyPay_Info;
	permanent	= FALSE;
	description	= "¿Por qué pagan todo los paladines?";
};                       

FUNC INT DIA_Hanna_WhyPay_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WhyPay_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_12"); //¿Por qué pagan todo los paladines?
	AI_Output (self, other, "DIA_Hanna_Add_17_13"); //Yo tampoco sé de qué va todo eso.
	AI_Output (self, other, "DIA_Hanna_Add_17_14"); //Por una cosa: creo que quieren apartar a todos los pobres infelices de las calles, para que no se metan en líos.
	AI_Output (self, other, "DIA_Hanna_Add_17_15"); //Y además, quieren agradar a los comerciantes viajeros.
	AI_Output (self, other, "DIA_Hanna_Add_17_16"); //Ahora que los granjeros se están rebelando, dependemos de los comerciantes para obtener provisiones.
	AI_Output (self, other, "DIA_Hanna_Add_17_17"); //Además, creo que quieren mejorar un poco la moral de la ciudad.
	AI_Output (self, other, "DIA_Hanna_Add_17_18"); //Lord Andre incluso ha hecho que se invite a una cerveza gratis en la plaza de la horca.
};

//*****************************************
//	WerHier - PERM
//*****************************************
INSTANCE DIA_Hanna_WerHier(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 4;
	condition	= DIA_Hanna_WerHier_Condition;
	information	= DIA_Hanna_WerHier_Info;
	permanent	= TRUE;
	description	= "¿Quién se aloja aquí en este momento?";
};                       

FUNC INT DIA_Hanna_WerHier_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WerHier_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_08"); //¿Quién se aloja aquí en este momento?
	AI_Output (self, other, "DIA_Hanna_Add_17_09"); //Casi todos son comerciantes del mercado.
	AI_Output (other, self, "DIA_Hanna_Add_15_10"); //Ajá.
	AI_Output (self, other, "DIA_Hanna_Add_17_11"); //¡Ni se te ocurra enredar con sus cosas! ¡No quiero ningún problema aquí!
};

//**********************************************
//	Ich hab noch ein paar Fragen zur Stadt
//**********************************************

INSTANCE DIA_Hanna_City(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 5;
	condition	= DIA_Hanna_City_Condition;
	information	= DIA_Hanna_City_Info;
	permanent	= TRUE;
	description	= "Tengo unas cuantas preguntas sobre la ciudad...";
};                       

FUNC INT DIA_Hanna_City_Condition()
{
		return TRUE;	
};
 
FUNC VOID DIA_Hanna_City_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_City_15_00"); //Tengo unas cuantas preguntas sobre la ciudad...
	
	Info_ClearChoices (DIA_Hanna_City);
	Info_AddChoice (DIA_Hanna_City,DIALOG_BACK,DIA_Hanna_City_Back);
	Info_AddChoice (DIA_Hanna_City,"¿Dónde puedo comprar algo por aquí?",DIA_Hanna_City_Buy);
	Info_AddChoice (DIA_Hanna_City,"Háblame de la ciudad.",DIA_Hanna_City_City);
};

FUNC VOID DIA_Hanna_City_Back ()
{
	Info_ClearChoices (DIA_Hanna_City);
};

FUNC VOID DIA_Hanna_City_Buy ()
{
	AI_Output (other,self ,"DIA_Hanna_City_Buy_15_00"); //¿Dónde puedo comprar algo por aquí?
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_01"); //El mercado está justo enfrente. Allí deberías poder encontrar de todo.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_02"); //Hay unas cuantas tiendas y artesanos más al otro lado de la ciudad. La mayoría están junto a la otra puerta.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_03"); //Además, hay un pescadero en el distrito del puerto. Su tienda está directamente en el puerto. Es fácil de encontrar.
};

FUNC VOID DIA_Hanna_City_City ()
{
	AI_Output (other,self ,"DIA_Hanna_City_City_15_00"); //Háblame de la ciudad.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_01"); //Khorinis es una de las ciudades más ricas del reino, aunque ahora mismo no lo parezca.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_02"); //Pero desde que empezó la guerra orca, el comercio se ha paralizado casi por completo. El rey ha requisado toda la flota mercante para el servicio militar,
	AI_Output (self ,other,"DIA_Hanna_City_City_17_03"); //Lo que significa que ahora ya no atraca casi ningún barco en el puerto. Por eso, el suministro de bienes es escaso y muchos ciudadanos están muy preocupados.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_04"); //Nadie sabe realmente cómo acabará esto. Prácticamente no hay nada que hacer, excepto esperar a ver qué ocurre. No podemos cambiar nada.
};



//##################################
//##
//##	Kapitel 3
//##
//##################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Hanna_Kap3_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_Kap3_EXIT_Condition;
	information	= DIA_Hanna_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hanna_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

var int Hanna_PriceForLetter;

// ************************************************************
// 		Wie sieht´s aus?
// ************************************************************
INSTANCE DIA_Hanna_AnyNews(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_AnyNews_Condition;
	information	= DIA_Hanna_AnyNews_Info;
	permanent	= FALSE;
	description = "¿Qué pasa?";
};                       
FUNC INT DIA_Hanna_AnyNews_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_AnyNews_15_00"); //¿Cómo va todo?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_17_01"); //No parece que te importen lo más mínimo las preocupaciones de los demás.
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Sí, claro que sí.",DIA_Hanna_AnyNews_Yes);
	Info_AddChoice (DIA_Hanna_AnyNews,"Eso depende.",DIA_Hanna_AnyNews_Depends);
	Info_AddChoice (DIA_Hanna_AnyNews,"No mucho.",DIA_Hanna_AnyNews_No);
};

FUNC VOID DIA_Hanna_AnyNews_No ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_No_15_00"); //No mucho.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_No_17_01"); //Eso es lo que digo. Aquí nadie piensa más que en sí mismo. Así que, ¿qué quieres?

	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Depends ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Depends_15_00"); //Eso depende.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_01"); //Eso depende de cuánto hay disponible, querrás decir...
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_02"); //No me sirve de nada la gente como tú.


	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_15_00"); //Ya, claro.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_01"); //¿Qué sabrás tú?, el mundo está lleno de sorpresas. Hace poco hice limpieza y vendí un montón de mapas a Brahim, el cartógrafo del puerto.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_02"); //Desafortunadamente, me he dado cuenta de que me falta un documento.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_03"); //Creo que ha debido colarse entre los papeles.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_04"); //¿Podrías traérmelo?
	
	MIS_HannaRetrieveLetter = LOG_RUNNING;

	Log_CreateTopic (TOPIC_HannaRetrieveLetter, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter, LOG_RUNNING);
	B_LogEntry (TOPIC_HannaRetrieveLetter,"Hanna ha perdido un documento. Parece que desapareció en el puerto, por donde está Brahim, el cartógrafo."); 


	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"No soy un chico de los recados.",DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice (DIA_Hanna_AnyNews,"¿Qué obtengo yo a cambio?",DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice (DIA_Hanna_AnyNews,"Veré lo que puedo hacer.",DIA_Hanna_AnyNews_Yes_WillSee);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Footboy ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Footboy_15_00"); //No soy un chico de los recados.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01"); //Ya veo. Los problemas de una mujer normal son demasiado profanos para ti. Supongo que tendré que ocuparme yo misma.

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_15_00"); //¿Qué obtengo yo a cambio?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01"); //Ajá, lo sabía, no eres mejor que la chusma del puerto.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02"); //¿Y qué es lo que le pides a una pobre mujer?
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Da lo mismo.",DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice (DIA_Hanna_AnyNews,"Podrías ser un poco amable conmigo.",DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice (DIA_Hanna_AnyNews,"Oro.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_OK ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00"); //Da lo mismo.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01"); //Al menos te queda un ápice de decencia. Si me recuperas el documento, te daré 75 monedas de oro.

	Hanna_PriceForLetter = 75;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_BeNice ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00"); //Podrías ser un poco amable conmigo.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01"); //Pero eso es ultrajante. Yo... ¡sal de aquí! ¡Paleto grosero!
	
	MIS_HannaRetrieveLetter = LOG_FAILED;
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_Gold ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00"); //Oro.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01"); //Sucio dinero es más de lo que puedo ofrecerte. En fin, valdrá 50 monedas de oro para mí.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02"); //Si te las arreglas para traer el documento de vuelta, te daré 50 monedas de oro.

	Hanna_PriceForLetter = 50;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};	

FUNC VOID DIA_Hanna_AnyNews_Yes_WillSee ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_WillSee_15_00"); //Veré lo que puedo hacer.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01"); //Eres un encanto. ¡Te deseo mucha suerte!
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02"); //Si me traes el papel, te daré una recompensa.
	
	Hanna_PriceForLetter = 200;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};


// ************************************************************
//		Meinst du dieses Schriftstück?
// ************************************************************
INSTANCE DIA_Hanna_ThisLetter(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_ThisLetter_Condition;
	information	= DIA_Hanna_ThisLetter_Info;
	permanent	= FALSE;
	description = "¿Te refieres a este documento?";
};                       
FUNC INT DIA_Hanna_ThisLetter_Condition()
{
	if (MIS_HannaRetrieveLetter == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_ShatteredGolem_Mis) >= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_ThisLetter_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_00"); //¿Te refieres a este documento?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_01"); //Sí, ése es. Gracias.
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_02"); //¿Cuál es mi recompensa?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_03"); //No tan rápido. Aquí tienes tu dinero.
		
	CreateInvItems (self,ItMi_Gold,Hanna_PriceForLetter);
	B_GiveInvItems (self,other,ItMi_Gold,Hanna_PriceForLetter);
	
	MIS_HannaRetrieveLetter = LOG_SUCCESS;
	B_GivePlayerXP (XP_HannaRetrieveLetter);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hanna_PICKPOCKET (C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 900;
	condition	= DIA_Hanna_PICKPOCKET_Condition;
	information	= DIA_Hanna_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Hanna_PICKPOCKET_Condition()
{
	C_Beklauen (45, 25);
};
 
FUNC VOID DIA_Hanna_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hanna_PICKPOCKET);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_BACK 		,DIA_Hanna_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hanna_PICKPOCKET_DoIt);
};

func void DIA_Hanna_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};
	
func void DIA_Hanna_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};


// ************************************************************
//						Aus Keller
// ************************************************************

INSTANCE DIA_Hanna_AusKeller(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 11;
	condition	= DIA_Hanna_AusKeller_Condition;
	information	= DIA_Hanna_AusKeller_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Hanna_AusKeller_Condition()
{
	if (Npc_HasItems (other, ItKe_ThiefGuildKey_Hotel_MIS) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_AusKeller_Info()
{	
	if (Cassia.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Jesper.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Ramirez.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_27"); //¿De dónde... vienes?
		AI_Output (other, self, "DIA_Hanna_Add_15_28"); //Encontré algo interesante en tu bodega...
		AI_Output (self, other, "DIA_Hanna_Add_17_29"); //¡¿Qué estabas haciendo en mi bodega?!
		AI_Output (other, self, "DIA_Hanna_Add_15_30"); //¡Lo sabes perfectamente!
		AI_Output (self, other, "DIA_Hanna_Add_17_31"); //(Con frialdad) No sé de qué estás hablando...
	}
	else 
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_19"); //(Suspicaz) ¡Mírate! ¿De dónde sales? ¿Eh?
		AI_Output (other, self, "DIA_Hanna_Add_15_20"); //(Avergonzado) Yo...
		AI_Output (self, other, "DIA_Hanna_Add_17_21"); //(Se ríe) ¡Ya sé!
		AI_Output (self, other, "DIA_Hanna_Add_17_22"); //(Con tono conspirativo) No tienes que explicármelo. Lo sé todo.
		AI_Output (self, other, "DIA_Hanna_Add_17_23"); //Pero que no se te ocurra robar nada aquí, ¿de acuerdo?
		AI_Output (self, other, "DIA_Hanna_Add_17_24"); //No podemos permitirnos llamar la atención sobre el hotel.
	};	
	
	AI_StopProcessInfos (self);
};

// ************************************************************
//						Schuldenbuch zeigen
// ************************************************************

INSTANCE DIA_Hanna_Schuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Schuldenbuch_Condition;
	information	= DIA_Hanna_Schuldenbuch_Info;
	permanent	= FALSE;
	description	= "¡Mira qué libro tengo aquí!";
};                       
FUNC INT DIA_Hanna_Schuldenbuch_Condition()
{
	if (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_Schuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_41"); //¡Mira qué libro tengo aquí!
	AI_Output (self, other, "DIA_Hanna_Add_17_42"); //El libro de cuentas de Lehmar. ¿Cómo lo has conseguido?
	AI_Output (other, self, "DIA_Hanna_Add_15_43"); //Bueno...
	AI_Output (self, other, "DIA_Hanna_Add_17_44"); //Si Lehmar ya no lo tiene, me parece bien. Pero preferiría tenerlo yo...
};

// ************************************************************
//						Schuldenbuch geben
// ************************************************************
instance DIA_Hanna_GiveSchuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_GiveSchuldenbuch_Condition;
	information	= DIA_Hanna_GiveSchuldenbuch_Info;
	permanent	= FALSE;
	description = "Toma, cógelo.";
};                       
FUNC INT DIA_Hanna_GiveSchuldenbuch_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Schuldenbuch))
	&& (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_GiveSchuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_45"); //Toma, cógelo.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self, other, "DIA_Hanna_Add_17_46"); //Gracias.
	AI_Output (self, other, "DIA_Hanna_Add_17_47"); //Toma esto como recompensa.
	B_GiveInvItems (self, other, ItSe_HannasBeutel, 1);
	B_GivePlayerXP (XP_Schuldenbuch);
	AI_Output (other, self, "DIA_Hanna_Add_15_49"); //¿Qué es esto que me has dado?
	AI_Output (self, other, "DIA_Hanna_Add_17_48"); //Es una llave para la puerta de la riqueza.
};


// ************************************************************
// 			  				
// ************************************************************
func void Hanna_Blubb()
{
	AI_Output (other, self, "DIA_Hanna_Add_15_37"); //¿Va todo bien en el escondite?
	AI_Output (self, other, "DIA_Hanna_Add_17_39"); //No he visto a ninguno desde hace tiempo.
	AI_Output (self, other, "DIA_Hanna_Add_17_40"); //Debería bajar por allí cuando tenga la oportunidad y echar un vistazo.
	AI_Output (self, other, "DIA_Hanna_Add_17_38"); //Sí. Pero será mejor que no hables sobre ello...
	//-------------------
	AI_Output (other, self, "DIA_Hanna_Add_15_25"); //¿Conocías el escondite de los ladrones?
	AI_Output (self, other, "DIA_Hanna_Add_17_26"); //(Sonríe afectadamente) No sé de qué estás hablando...
	//-------------------
	AI_Output (self, other, "DIA_Hanna_Add_17_32"); //La milicia estuvo aquí... ¡Alguien reveló el escondite!
	AI_Output (self, other, "DIA_Hanna_Add_17_33"); //No pudieron imputarme nada, ¡pero Cassia y los suyos están muertos!
	AI_Output (self, other, "DIA_Hanna_Add_17_34"); //Estoy segura de que fuiste TÚ...
	AI_Output (self, other, "DIA_Hanna_Add_17_35"); //Compré esto especialmente para ti.
	AI_Output (self, other, "DIA_Hanna_Add_17_36"); //Me costó mucho dinero, pero tú te lo mereces, puerco...
};	

	
