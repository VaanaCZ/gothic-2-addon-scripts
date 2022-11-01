// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Matteo_EXIT(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 999;
	condition	= DIA_Matteo_EXIT_Condition;
	information	= DIA_MAtteo_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Matteo_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Matteo_PICKPOCKET (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 900;
	condition	= DIA_Matteo_PICKPOCKET_Condition;
	information	= DIA_Matteo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Matteo_PICKPOCKET_Condition()
{
	C_Beklauen (80, 150);
};
 
FUNC VOID DIA_Matteo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Matteo_PICKPOCKET);
	Info_AddChoice		(DIA_Matteo_PICKPOCKET, DIALOG_BACK 		,DIA_Matteo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Matteo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Matteo_PICKPOCKET_DoIt);
};

func void DIA_Matteo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Matteo_PICKPOCKET);
};
	
func void DIA_Matteo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Matteo_PICKPOCKET);
};
// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Matteo_Hallo(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 1;
	condition	= DIA_Matteo_Hallo_Condition;
	information	= DIA_MAtteo_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Matteo_Hallo_Condition()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Hallo_Info()
{	
	AI_Output (self, other, "DIA_Matteo_Hallo_09_00"); //¿Qué puedo hacer por ti?
};

// ************************************************************
// 			  				   Sell What 
// ************************************************************
INSTANCE DIA_Matteo_SellWhat(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 1;
	condition	= DIA_Matteo_SellWhat_Condition;
	information	= DIA_MAtteo_SellWhat_Info;
	permanent	= FALSE;
	description = "¿Qué vendes?";
};                       
FUNC INT DIA_Matteo_SellWhat_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_SellWhat_Info()
{	
	AI_Output (other, self, "DIA_Matteo_SellWhat_15_00"); //¿Qué vendes?
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_01"); //Puedo ofrecerte todo lo que necesitas para sobrevivir en terrenos salvajes. Armas, antorchas, provisiones... incluso armaduras.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_02"); //Todavía tengo una pieza especial en el almacén.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_03"); //Armadura doble endurecida de piel de chasqueador, sin usar. ¿Te interesa?
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"La tienda de Matteo está en la puerta sur de la ciudad. Vende equipo, armas y pertrechos.");
		Knows_Matteo = TRUE;
	};
};

// *********************************************************
// 		  					TRADE 				
// *********************************************************
INSTANCE DIA_Matteo_TRADE (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 800;
	condition	= DIA_Matteo_TRADE_Condition;
	information	= DIA_Matteo_TRADE_Info;
	permanent	= TRUE;
	description = "Enséñame tu mercancía.";
	Trade		= TRUE;
};                       
FUNC INT DIA_Matteo_TRADE_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};	
};

var int Matteo_TradeNewsPermanent;

FUNC VOID DIA_Matteo_TRADE_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other,self ,"DIA_Matteo_TRADE_15_00"); //Enséñame tu mercancía.
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	&& (Matteo_TradeNewsPermanent == FALSE)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_01"); //Desde que los mercenarios se cargaron al paladín Lothar, las inspecciones de los paladines se han endurecido un montón.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_02"); //Espero que el tema se suavice cuando cuelguen al asesino.
	
		Matteo_TradeNewsPermanent = 1;
	};
	if (Kapitel == 5)
	&& (Matteo_TradeNewsPermanent < 2)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_03"); //Parece que los paladines van en serio esta vez. Incluso han retirado a sus guardias de barcos.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_04"); //Están bien que refresques tus suministros otra vez. Quién sabe si la ciudad seguirá en pie la semana que viene.
	
		Matteo_TradeNewsPermanent = 2;
	};
};

// *********************************************************
// 		  					ARMOR 				
// *********************************************************

//-------------------------------------
	var int Matteo_LeatherBought;
//-------------------------------------

instance DIA_Matteo_LEATHER		(C_INFO)
{
	npc			 = 	VLK_416_Matteo;
	nr			 =  850;
	condition	 = 	DIA_Matteo_LEATHER_Condition;
	information	 = 	DIA_Matteo_LEATHER_Info;
	permanent	 = 	TRUE;
	description	 = 	"Comprar armadura de cuero. Protección: armas 25, flechas 20. (250 de oro)";
};

func int DIA_Matteo_LEATHER_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	&& (Matteo_LeatherBought == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Matteo_LEATHER_Info ()
{
	AI_Output (other, self, "DIA_Matteo_LEATHER_15_00"); //De acuerdo, dame la armadura.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 250)
	{	
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_01"); //Te encantará. (Sonríe)

		B_GiveInvItems 	(self, other, ItAr_Leather_L, 1);
		Matteo_LeatherBought = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_02"); //La armadura tiene un precio y lo vale. Así que regresa cuando tengas suficiente dinero.
	};
};

// ************************************************************
// 			  				Paladine 			E1
// ************************************************************
INSTANCE DIA_Matteo_Paladine(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_Paladine_Condition;
	information	= DIA_MAtteo_Paladine_Info;
	permanent	= FALSE;
	description = "¿Qué sabes de los paladines?";
};                       
FUNC INT DIA_Matteo_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Matteo_Paladine_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Paladine_15_00"); //¿Qué sabes de los paladines?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_01"); //Desde que esos bastardos llegaron a la ciudad, no he tenido más que problemas.
	AI_Output (self, other, "DIA_Matteo_Paladine_09_02"); //La última vez que fui a la parte alta de la ciudad, los guardias me detuvieron en seco y me preguntaron ¡qué me llevaba por allí!
	AI_Output (other, self, "DIA_Matteo_Paladine_15_03"); //¿Y?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_04"); //Naturalmente, me dejaron entrar.
	AI_Output (self, other, "DIA_Matteo_Paladine_09_05"); //¡Yo ya tenía mi tienda en la ciudad cuando la mayoría de esos burros pomposos aún estaban persiguiendo cerdos con espadas de madera!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_06"); //¡Y ayer los muy bastardos vinieron y me confiscaron la mitad de mis bienes!
};

// ************************************************************
// 			  				Confiscated 			E2
// ************************************************************
INSTANCE DIA_Matteo_Confiscated(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_Confiscated_Condition;
	information	= DIA_MAtteo_Confiscated_Info;
	permanent	= FALSE;
	description = "¿Los paladines te confiscaron tus bienes?";
};                       
FUNC INT DIA_Matteo_Confiscated_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_Paladine))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Confiscated_Info()
{	

	AI_Output (other, self, "DIA_Matteo_Confiscated_15_00"); //¿Los paladines te confiscaron tus bienes?
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_01"); //Todo lo que tenía almacenado en el patio trasero.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_02"); //Simplemente plantaron un guardia frente a la entrada del patio.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_03"); //Si tengo suerte, no se lo llevarán todo. Al menos podrían dejar aquí la armadura.
};

// ************************************************************
// 			  				HelpMeToOV 			E2
// ************************************************************
INSTANCE DIA_Matteo_HelpMeToOV(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeToOV_Condition;
	information	= DIA_MAtteo_HelpMeToOV_Info;
	permanent	= FALSE;
	description = "¿Puedes ayudarme a entrar en el barrio alto?";
};                       
FUNC INT DIA_Matteo_HelpMeToOV_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_Paladine))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HelpMeToOV_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_00"); //¿Puedes ayudarme a entrar en el barrio alto?
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_01"); //(Aturdido) ¿Qué? ¿Qué vas a hacer ALLÍ?
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_02"); //Tengo un mensaje importante...
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_03"); //Vale, vale... ¿Has intentado colarte entre los guardias?

	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_04"); //(Riendo amargamente) Oh, tío, ¡olvídalo!
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_05"); //(Se ríe) ¡Eso es TÍPICO de esos mendigos!
	}
	else
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_06"); //No sé por qué debería intentarlo siquiera.
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_07"); //Probablemente tengas razón.
	};
	
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_08"); //No sé lo IMPORTANTE que es tu mensaje, ni me incumbe.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_09"); //Pero aunque les cuentes que un barco lleno de orcos acaba de atracar en el puerto, no te dejarán pasar.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_10"); //Porque obedecen ÓRDENES.
};

// ************************************************************
// 			  				HelpMeNow 			E3
// ************************************************************

func void B_Matteo_Preis()
{
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_01"); //Parece ser muy importante para ti.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_02"); //(Astutamente) La cuestión es: ¿CÓMO de importante es para ti?
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_03"); //¿Dónde quieres ir a parar?
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_04"); //Puedo ayudarte. Después de todo, soy una de las personas más influyentes aquí.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_05"); //Pero te costará algo.
};


INSTANCE DIA_Matteo_HelpMeNow(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeNow_Condition;
	information	= DIA_MAtteo_HelpMeNow_Info;
	permanent	= FALSE;
	description = "Entonces, ¿puedes ayudarme a entrar en el barrio alto?";
};                       
FUNC INT DIA_Matteo_HelpMeNow_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HelpMeToOV))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HelpMeNow_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_00"); //Entonces, ¿puedes ayudarme a entrar en el barrio alto?
	B_Matteo_Preis();
};

// ************************************************************
// 			  		LEHRLING als GILDE X
// ************************************************************
INSTANCE DIA_Matteo_LehrlingLater(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_LehrlingLater_Condition;
	information	= DIA_MAtteo_LehrlingLater_Info;
	permanent	= FALSE;
	description = "Ayúdame a convertirme en aprendiz de uno de los maestros.";
};                       
FUNC INT DIA_Matteo_LehrlingLater_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
func VOID DIA_Matteo_LehrlingLater_Info()
{	
	AI_Output (other, self, "DIA_Matteo_LehrlingLater_15_00"); //Entonces, ¿puedes ayudarme a entrar en el barrio alto?
	B_Matteo_Preis();
};
	
// ************************************************************
// 			  		PriceOfHelp  (MISSION)			E4
// ************************************************************
INSTANCE DIA_Matteo_PriceOfHelp(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_PriceOfHelp_Condition;
	information	= DIA_MAtteo_PriceOfHelp_Info;
	permanent	= FALSE;
	description = "¿Qué pides a cambio de tu ayuda?";
};                       
FUNC INT DIA_Matteo_PriceOfHelp_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo (other,DIA_Matteo_LehrlingLater))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_PriceOfHelp_Info()
{	
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_15_00"); //¿Qué pides a cambio de tu ayuda?
	AI_Output (self, other, "DIA_Matteo_PriceOfHelp_09_01"); //100 monedas de oro.
	
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "Es un montón...", DIA_Matteo_PriceOfHelp_Wow);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "¡Eres una rata!", DIA_Matteo_PriceOfHelp_Cutthroat);
};

func void B_Matteo_RegDichAb()
{
	AI_Output (self, other, "B_Matteo_RegDichAb_09_00"); //¡Tranquilo! No es TU oro el que tengo en mente.
	AI_Output (other, self, "B_Matteo_RegDichAb_15_01"); //¿Entonces?
	AI_Output (self, other, "B_Matteo_RegDichAb_09_02"); //En principio, es MI oro.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_03"); //Gritta, la sobrina del carpintero, no me ha pagado lo que me debe desde hace años.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_04"); //Pero la pequeña mocosa lleva constantemente ropa nueva, lo que significa que tiene dinero.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_05"); //Me gustaría sacárselo a palos, pero el maestro Thorben, el carpintero, también es un hombre muy influyente.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_06"); //Consígueme el dinero y te ayudaré.
	
	MIS_Matteo_Gold = LOG_RUNNING;
	Log_CreateTopic (Topic_Matteo,LOG_MISSION);
	Log_SetTopicStatus	(Topic_Matteo,LOG_RUNNING);
	B_LogEntry (Topic_Matteo,"Gritta, la sobrina de Thorben, el carpintero, debe a Matteo 100 monedas de oro. Si consigo que las recupere, me ayudará a entrar en el barrio alto.");
};

func void DIA_Matteo_PriceOfHelp_Cutthroat()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Cutthroat_15_00"); //¡Eres una rata!
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

func void DIA_Matteo_PriceOfHelp_Wow()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Wow_15_00"); //Es un montón...
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

// ************************************************************
// 			  				WoGritta 			E5
// ************************************************************
INSTANCE DIA_Matteo_WoGritta(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_WoGritta_Condition;
	information	= DIA_MAtteo_WoGritta_Info;
	permanent	= FALSE;
	description = "¿Dónde puedo encontrar a esta Gritta?";
};                       
FUNC INT DIA_Matteo_WoGritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (Gritta.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WoGritta_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WoGritta_15_00"); //¿Dónde puedo encontrar a esta Gritta?
	AI_Output (self, other, "DIA_Matteo_WoGritta_09_01"); //Como te dije, es la sobrina del carpintero. Su casa está calle abajo, la última a la derecha antes de la herrería.
};

// ************************************************************
// 			  				GoldRunning 			E5
// ************************************************************
INSTANCE DIA_Matteo_GoldRunning(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 500;
	condition	= DIA_Matteo_GoldRunning_Condition;
	information	= DIA_MAtteo_GoldRunning_Info;
	permanent	= TRUE;
	description = "¡Aquí tienes tus 100 monedas de oro!";
};                       
FUNC INT DIA_Matteo_GoldRunning_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& ( Npc_KnowsInfo(other,DIA_Gritta_WantsMoney) || Npc_IsDead(Gritta) )
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_GoldRunning_Info()
{	
	AI_Output (other, self, "DIA_Matteo_GoldRunning_15_00"); //¡Aquí tienes tus 100 monedas de oro!
	
	//EXIT IF...
	
	if (Npc_IsDead(Gritta))
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_01"); //¡Ese oro está manchado con la sangre de Gritta! ¡No te dije nada acerca de matarla!
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_02"); //No quiero tener nada que ver con este asunto. ¡Olvídate de nuestro trato! ¡Y no vuelvas a hablarme del tema nunca!
		MIS_Matteo_Gold = LOG_FAILED;
		B_CheckLog();
		AI_StopProcessInfos	(self);
		return;
	};
	
	// FUNC

	if (B_GiveInvItems (other, self, itmi_gold, 100))
	{
		if (Npc_HasItems(Gritta, itmi_gold) < 100)
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_03"); //¿Y? ¿Te causó algún problema?
			AI_Output (other, self, "DIA_Matteo_GoldRunning_15_04"); //Ninguno reseñable.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_05"); //¡Bien! Has cumplido tu parte del trato.
		}
		else
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_06"); //¿Quieres pagar por ella? Mm, ¡lo habría preferido si se lo hubieras sacado a la fuerza!
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_07"); //Aún así, 100 monedas de oro son 100 monedas de oro.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_08"); //Has cumplido tu parte del trato.
		};
		
		MIS_Matteo_Gold = LOG_SUCCESS;
		B_GivePlayerXP (XP_Matteo_Gold);
	}
	else
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_09"); //Contar no es lo tuyo, ¿no? No tienes 100 monedas de oro.
	};
};

// ************************************************************
// 		  				Stimme abgeben		E5 - PERM
// ************************************************************

instance DIA_Matteo_Zustimmung(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_Zustimmung_Condition;
	information	= DIA_MAtteo_Zustimmung_Info;
	permanent	= TRUE;
	description = "Ayúdame a convertirme en aprendiz de uno de los maestros.";
};          
var int   DIA_Matteo_Zustimmung_perm;          
FUNC INT DIA_Matteo_Zustimmung_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& ( (MIS_Matteo_Gold == LOG_RUNNING) || (MIS_Matteo_Gold == LOG_SUCCESS) )
	&& (Player_IsApprentice == APP_NONE)
	&& (DIA_Matteo_Zustimmung_perm == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Zustimmung_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Zustimmung_15_00"); //¡Ayúdame a entrar como aprendiz de uno de los maestros!
	
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_01"); //No te preocupes, cumpliré mi parte del trato.
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_02"); //Los demás maestros solo oirán de mí palabras buenas sobre ti.
		
		B_GivePlayerXP (XP_Zustimmung);
		B_LogEntry (Topic_Lehrling,"Matteo dará su consentimiento si quiero empezar como aprendiz en cualquier lado.");
		DIA_Matteo_Zustimmung_perm = TRUE;
	}
	else //LOG_RUNNING
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_03"); //Cada cosa a su tiempo. ¡Primero cumple tu parte del trato y tráeme el oro!
	};
};

// ************************************************************
// 			  				HowCanYouHelp 			E4
// ************************************************************
INSTANCE DIA_Matteo_HowCanYouHelp (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_HowCanYouHelp_Condition;
	information	= DIA_MAtteo_HowCanYouHelp_Info;
	permanent	= FALSE;
	description = "¿EXACTAMENTE cómo puedes ayudarme?";
};                       
FUNC INT DIA_Matteo_HowCanYouHelp_Condition()
{	
	if ((Npc_KnowsInfo (other,DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo (other,DIA_Matteo_LehrlingLater)))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HowCanYouHelp_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HowCanYouHelp_15_00"); //¿EXACTAMENTE cómo puedes ayudarme?
	AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_01"); //Muy fácil. Usaré mi influencia para hacer que uno de los maestros artesanos de aquí te acepte como aprendiz.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_02"); //Como tal, serás prácticamente un ciudadano y podrás entrar en el barrio alto. Además, ganarás algo de dinero, de paso.
	};
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling,"Matteo me puede ayudar a que uno de los maestros artesanos me acepte como aprendiz.");
};	

// ************************************************************
// 			  				WoAlsLehrling 			E5
// ************************************************************
INSTANCE DIA_Matteo_WoAlsLehrling (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_WoAlsLehrling_Condition;
	information	= DIA_MAtteo_WoAlsLehrling_Info;
	permanent	= FALSE;
	description = "Entonces, ¿dónde me inscribo como aprendiz?";
};                       
FUNC INT DIA_Matteo_WoAlsLehrling_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WoAlsLehrling_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WoAlsLehrling_15_00"); //Entonces, ¿dónde me inscribo como aprendiz?
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_01"); //Básicamente, con cualquier maestro de la calle principal.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_02"); //O sea: Harad el herrero, Bosper el arquero, Thorben el carpintero o Constantino al alquimista.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_03"); //Uno de ellos tendrá que aceptarte.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_04"); //Pero es importante que los otros maestros estén de acuerdo. Ésa ha sido siempre la costumbre, aquí en Khorinis.
	
	Log_CreateTopic (Topic_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (Topic_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Puedo empezar como aprendiz de Bosper, el fabricante de arcos, Harad, el herrero, Thorben, el carpintero o Constantino, el alquimista.");
	B_LogEntry (Topic_Lehrling,"Antes de convertirme en aprendiz, necesito el consentimiento del resto de los maestros.");
};
// ************************************************************
// 			  				WieZustimmung 			E6
// ************************************************************
INSTANCE DIA_Matteo_WieZustimmung (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 5;
	condition	= DIA_Matteo_WieZustimmung_Condition;
	information	= DIA_MAtteo_WieZustimmung_Info;
	permanent	= FALSE;
	description = "¿Cómo consigo la aprobación de los otros maestros?";
};                       
FUNC INT DIA_Matteo_WieZustimmung_Condition()
{	
	if ( Npc_KnowsInfo (other,DIA_Matteo_WoAlsLehrling) || Npc_KnowsInfo (other,DIA_Matteo_WarumNichtBeiDir) )
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WieZustimmung_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WieZustimmung_15_00"); //¿Cómo consigo la aprobación de los otros maestros?
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_01"); //Solo tienes que convencerlos. Ve a hablar con ellos.
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_02"); //Pero si más de uno de ellos está en tu contra, ¡no tendrás ninguna oportunidad! ¡Así que pórtate bien!
	
	B_LogEntry (Topic_Lehrling,"Solo puedo conseguir el consentimiento de los maestros si les demuestro mi valía.");
};	

// ************************************************************
// 			  				WarumNichtBeiDir 			E5
// ************************************************************
INSTANCE DIA_Matteo_WarumNichtBeiDir (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 6;
	condition	= DIA_Matteo_WarumNichtBeiDir_Condition;
	information	= DIA_MAtteo_WarumNichtBeiDir_Info;
	permanent	= FALSE;
	description = "¿Por qué no me admites TÚ como aprendiz?";
};                       
FUNC INT DIA_Matteo_WarumNichtBeiDir_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WarumNichtBeiDir_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WarumNichtBeiDir_15_00"); //¿Por qué no me admites TÚ como aprendiz?
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_01"); //Lo haría, pero los otros maestros no aceptarían.
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_02"); //He cogido un aprendiz hace poco.
};	

// ************************************************************
// 			  				Andere Möglichkeie 			E5
// ************************************************************
INSTANCE DIA_Matteo_OtherWay (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 6;
	condition	= DIA_Matteo_OtherWay_Condition;
	information	= DIA_MAtteo_OtherWay_Info;
	permanent	= FALSE;
	description = "¿Hay otra forma de entrar en el barrio alto?";
};                       
FUNC INT DIA_Matteo_OtherWay_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_OtherWay_Info()
{	
	AI_Output (other, self, "DIA_Matteo_OtherWay_15_00"); //¿Hay otra forma de entrar en el barrio alto?
	AI_Output (self, other, "DIA_Matteo_OtherWay_09_01"); //Quizá... Si doy con alguna, te lo diré.
};	

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Matteo_Minenanteil (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_Minenanteil_Condition;
	information	= DIA_MAtteo_Minenanteil_Info;

	description = "Tienes algunas participaciones de la mina entre tu mercancía.";
};   
                    
FUNC INT DIA_Matteo_Minenanteil_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Matteo_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Minenanteil_15_00"); //Tienes algunas participaciones de la mina entre tu mercancía. ¿Quién te las vendió?
	AI_Output (self, other, "DIA_Matteo_Minenanteil_09_01"); //(Nervioso) ¿Participaciones de la mina? Vaya. ¿De dónde habrán salido? No tengo ni idea de dónde las saqué. En serio.
	B_GivePlayerXP (XP_Ambient);
};	





































