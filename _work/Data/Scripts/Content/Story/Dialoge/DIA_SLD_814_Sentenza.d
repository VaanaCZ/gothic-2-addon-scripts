// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Sentenza_EXIT(C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 999;
	condition	= DIA_Sentenza_EXIT_Condition;
	information	= DIA_Sentenza_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Sentenza_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sentenza_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			Hallo (Durchsuchen)
// ************************************************************
var int Sentenza_Wants50;
var int Sentenza_SearchDay;
// -------------------------------

instance DIA_Sentenza_Hello (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 1;
	condition	= DIA_Sentenza_Hello_Condition;
	information	= DIA_Sentenza_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       

FUNC INT DIA_Sentenza_Hello_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Sentenza_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Sentenza_Hello_09_00");	//¡¿Adónde te crees que vas?!
	
	self.aivar[AIV_LastFightComment] = TRUE;
	Sentenza_SearchDay = B_GetDayPlus();
	
	Info_ClearChoices	(DIA_Sentenza_Hello);
	Info_AddChoice		(DIA_Sentenza_Hello, "¿A ti qué te importa?" 			,DIA_Sentenza_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Sentenza_Hello, "Solo quería echar un vistazo, eso era todo."	,DIA_Sentenza_Hello_JustLooking);
};

func void DIA_Sentenza_Hello_JustLooking()
{
	AI_Output (other, self,"DIA_Sentenza_Hello_JustLooking_15_00"); //Solo quería echar un vistazo, eso era todo.
	AI_Output (self ,other,"DIA_Sentenza_Hello_JustLooking_09_01"); //(Se ríe) ¡Los que son como tú tienen problemas aquí! ¿De verdad que solo querías echar un vistazo?
	AI_Output (self ,other,"DIA_Sentenza_Hello_JustLooking_09_02"); //¡Ja! ¡Te diriges al patio! Si no, ¿por qué habrías venido hasta aquí, eh?
	AI_Output (self ,other,"DIA_Sentenza_Hello_JustLooking_09_03"); //Así que no me cuentes chorradas y deja que te registre. Entonces podrás continuar.
	
	Info_ClearChoices	(DIA_Sentenza_Hello);
	Info_AddChoice		(DIA_Sentenza_Hello, "¡Aleja esas manos!"				,DIA_Sentenza_Hello_HandsOff);
	Info_AddChoice		(DIA_Sentenza_Hello, "Tú mismo. ¡Regístrame!" 			,DIA_Sentenza_Hello_SearchMe);
};

func void DIA_Sentenza_Hello_NotYourBusiness()
{
	AI_Output (other, self,"DIA_Sentenza_Hello_NotYourBusiness_15_00"); //¿A ti que te importa?
	AI_Output (self ,other,"DIA_Sentenza_Hello_NotYourBusiness_09_01"); //(Suspira) Voy a tener que explicártelo.
	
	AI_StopProcessInfos (self);
	
	B_Attack(self, other, AR_NONE, 1);
};

	func void B_Sentenza_SearchMe()
	{
		var int playerGold; playerGold = Npc_HasItems(other, ItMi_Gold);
		
		AI_Output (other, self,"DIA_Sentenza_Hello_SearchMe_15_00"); //Tú mismo. ¡Regístrame!
		AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_01"); //Ahora veamos qué tienes por aquí...
		
		if (playerGold >= 50)
		{
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_02"); //¡Ah! ¡Oro! Llevar tanto oro puede ser peligroso.
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_03"); //Muchos de los mercenarios son auténticos asesinos. No como yo, que soy honesto.
			B_GiveInvItems (other, self, ItMi_Gold, 50);
			Sentenza_GoldTaken = TRUE;
		}
		else if (playerGold > 0)
		{
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_04"); //Bueno, no es que tengas mucho.
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_05"); //Volveré más tarde.
		}
		else
		{
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_06"); //¿Has venido hasta aquí sin oro?
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_07"); //No parece que te estés muriendo de hambre. Has tenido que esconder la pasta en algún sitio, ¿verdad?
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_08"); //De todas maneras, no eres tonto. Seguro que nos volvemos a encontrar. Cuídate hasta entonces.
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_09"); //¡Es posible que seas el único que sabe dónde está todo su oro!
		};
		
		Sentenza_Wants50 = TRUE;

		AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_10"); //Solo quiero 50 piezas de oro, es el peaje. Y solo tienes que pagar una vez. Razonable, ¿no?
	};

func void DIA_Sentenza_Hello_SearchMe()
{
	B_Sentenza_SearchMe();
	AI_StopProcessInfos (self);
};

func void DIA_Sentenza_Hello_HandsOff()
{
	AI_Output (other, self,"DIA_Sentenza_Hello_HandsOff_15_00"); //¡Aparta esas manazas!
	AI_Output (self ,other,"DIA_Sentenza_Hello_HandsOff_09_01"); //(Amenazador) ¿O qué?
	
	Info_ClearChoices	(DIA_Sentenza_Hello);
	Info_AddChoice		(DIA_Sentenza_Hello, "O nada. ¡Regístrame!"						,DIA_Sentenza_Hello_SearchMe);
	Info_AddChoice		(DIA_Sentenza_Hello, "¡O tardarás un tiempo en volver a registrar a alguien!"	,DIA_Sentenza_Hello_OrElse);
};

func void DIA_Sentenza_Hello_OrElse()
{
	AI_Output (other, self,"DIA_Sentenza_Hello_OrElse_15_00"); //¡O tardarás un tiempo en volver a registrar a alguien!
	AI_Output (self ,other,"DIA_Sentenza_Hello_OrElse_09_01"); //¡Ya lo veremos!
	
	AI_StopProcessInfos (self);
	B_Attack(self, other, AR_NONE, 1);
};


// ************************************************************
// 			  		Zweiter Versuch (Gold)
// ************************************************************

INSTANCE DIA_Sentenza_Vzwei (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 2;
	condition	= DIA_Sentenza_Vzwei_Condition;
	information	= DIA_Sentenza_Vzwei_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Sentenza_Vzwei_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Sentenza_GoldTaken == FALSE)
	&& (Sentenza_SearchDay < Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID DIA_Sentenza_Vzwei_Info()
{	
	AI_Output (self ,other,"DIA_Sentenza_Vzwei_09_00");	//Aquí estás otra vez. ¡A ver qué llevas esta vez!

	self.aivar[AIV_LastFightComment] = TRUE;
	Sentenza_SearchDay = B_GetDayPlus();
	
	Info_ClearChoices	(DIA_Sentenza_Vzwei);
	Info_AddChoice		(DIA_Sentenza_Vzwei, "¡Aleja tus sucias zarpas de mí!"		,DIA_Sentenza_Vzwei_HandsOff);
	
	
	
	Info_AddChoice		(DIA_Sentenza_Vzwei, "Tú mismo. ¡Regístrame!" 	,DIA_Sentenza_Vzwei_SearchMe);
};

func void DIA_Sentenza_Vzwei_SearchMe()
{
	B_Sentenza_SearchMe();
	
	AI_StopProcessInfos(self);
};

func void DIA_Sentenza_Vzwei_HandsOff()
{
	AI_Output (other, self,"DIA_Sentenza_Vzwei_HandsOff_15_00"); //¡Aleja tus sucias zarpas de mí!
	AI_Output (self ,other,"DIA_Sentenza_Vzwei_HandsOff_09_01"); //(Amenazador) ¿Con que ésas tenemos? ¡Parece que ahora llevas algo más encima!
	
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  			WannaJoin
// ************************************************************

INSTANCE DIA_Sentenza_WannaJoin (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 3;
	condition	= DIA_Sentenza_WannaJoin_Condition;
	information	= DIA_Sentenza_WannaJoin_Info;
	permanent	= FALSE;
	description	= "¡He venido a unirme a vosotros!";
};                       

FUNC INT DIA_Sentenza_WannaJoin_Condition()
{
	if (hero.guild == GIL_NONE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Sentenza_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_WannaJoin_15_00"); //¡He venido a unirme a vosotros!
	AI_Output (self, other, "DIA_Sentenza_WannaJoin_09_01"); //Enhorabuena.
	AI_Output (self, other, "DIA_Sentenza_WannaJoin_09_02"); //(Con indiferencia) ¿Sabes que los mercenarios tenemos que votar si te admite o no?
};

// ************************************************************
// 			  				Vote
// ************************************************************

INSTANCE DIA_Sentenza_Vote (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 4;
	condition	= DIA_Sentenza_Vote_Condition;
	information	= DIA_Sentenza_Vote_Info;
	permanent	= TRUE;
	description	= "¿Votarás por mí?";
};                       

FUNC INT DIA_Sentenza_Vote_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Sentenza_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Sentenza_Vote_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_Vote_15_00"); //¿Votarás por mí?
	
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other, "DIA_Sentenza_Vote_09_01"); //¿Solo porque me has pegado? (Se ríe) No.
	}
	else if (Npc_HasItems (self, itmi_gold) >= 50)
	&& 		( (Sentenza_GoldTaken == TRUE) ||	(Sentenza_GoldGiven == TRUE) )
	{
		AI_Output (self, other, "DIA_Sentenza_Vote_09_02"); //Bueno, ¿por qué no? 50 piezas de oro es un precio justo por un voto, ¿no te parece?
		
		Sentenza_Stimme = TRUE;
		B_LogEntry (TOPIC_SLDRespekt,"A Sentenza no le importa que me una a los mercenarios.");
	}
	else if (Sentenza_Stimme == TRUE)
	&& 		(Npc_HasItems (self, itmi_gold) < 50)
	{
		AI_Output (self, other, "DIA_Sentenza_Vote_09_03"); //¿Después de que me volvieras a quitar el oro? Me parece que no, hijo.
	}
	else
	{
		AI_Output (self, other, "DIA_Sentenza_Vote_09_04"); //¡No cuela, muchacho! Si quieres que vote por ti, tendrás que aflojar algo de oro.
		AI_Output (other, self, "DIA_Sentenza_Vote_15_05"); //¿Cuánto?
		AI_Output (self, other, "DIA_Sentenza_Vote_09_06"); //50 monedas de oro. Es la tarifa que habrías pagado de todas maneras.
		Sentenza_Wants50 = TRUE;
	};
};

// ************************************************************
// 			  				Pay50
// ************************************************************
var int Sentenza_GoldGiven;
// ------------------------

INSTANCE DIA_Sentenza_Pay50 (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 5;
	condition	= DIA_Sentenza_Pay50_Condition;
	information	= DIA_Sentenza_Pay50_Info;
	permanent	= TRUE;
	description	= "Toma las 50 monedas de oro.";
};                       

FUNC INT DIA_Sentenza_Pay50_Condition()
{
	if (Sentenza_Wants50 == TRUE)
	&& (Npc_HasItems (self, itmi_gold) < 50)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Sentenza_Pay50_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_Pay50_15_00"); //Toma las 50 monedas de oro.
	if (B_GiveInvItems (other, self, ItMi_Gold, 50))
	{
		AI_Output (self, other, "DIA_Sentenza_Pay50_09_01"); //Gracias, con esto bastará.
		Sentenza_GoldGiven = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Sentenza_Pay50_09_02"); //No juegues conmigo. 50 y ni una pieza más, ¿de acuerdo?
	};
};

// ************************************************************
// 			  				Gold zurückholen
// ************************************************************
var int Sentenza_Einmal;
// ---------------------

INSTANCE DIA_Sentenza_GoldBack (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 6;
	condition	= DIA_Sentenza_GoldBack_Condition;
	information	= DIA_Sentenza_GoldBack_Info;
	permanent	= TRUE;
	description = "¡Devuélveme mi oro!";
};                       

FUNC INT DIA_Sentenza_GoldBack_Condition()
{
	if (Npc_HasItems (self, itmi_gold) >= 50)
	{
		if (Sentenza_GoldGiven == FALSE)
		|| (other.guild == GIL_SLD)
		{
			return TRUE;
		};
	};
};
 
FUNC VOID DIA_Sentenza_GoldBack_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_GoldBack_15_00"); //¡Devuélveme mi oro!
	if (other.guild == GIL_SLD)
	&& (Torlof_SentenzaCounted == TRUE)
	&& (Sentenza_Einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Sentenza_GoldBack_09_01"); //¿Ahora que te he dado mi voto?
		AI_Output (self, other, "DIA_Sentenza_GoldBack_09_02"); //¡Será traicionero el pobretón!
		
		Sentenza_Einmal = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_NONE, 1);
	}
	else
	{
		AI_Output (self, other, "DIA_Sentenza_GoldBack_09_03"); //¡Tranquilo! Solo me lo voy a quedar un poco...
	};
};

// ************************************************************
// 			  				AufsMaul
// ************************************************************

INSTANCE DIA_Sentenza_AufsMaul (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 7;
	condition	= DIA_Sentenza_AufsMaul_Condition;
	information	= DIA_Sentenza_AufsMaul_Info;
	permanent	= FALSE; //FALSE!!!!!!!!!
	description = "Dime, ¿lo que tienes delante de la cabeza es tu cara o tu culo?";
};                       

FUNC INT DIA_Sentenza_AufsMaul_Condition()
{
	if (Npc_HasItems (self, itmi_gold) >= 50)
	|| (Npc_KnowsInfo (other, DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Sentenza_AufsMaul_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_AufsMaul_15_00"); //Dime, ¿lo que tienes delante de la cabeza es tu cara o tu culo?
	AI_Output (self, other, "DIA_Sentenza_AufsMaul_09_01"); //(Se ríe, enfadado) Vale, si es lo que quieres...
	
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  				AufsMaulAgain
// ************************************************************

INSTANCE DIA_Sentenza_AufsMaulAgain (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 8;
	condition	= DIA_Sentenza_AufsMaulAgain_Condition;
	information	= DIA_Sentenza_AufsMaulAgain_Info;
	permanent	= TRUE;
	description = "¡Vuelve a ser la hora del reparto!";
};                       

FUNC INT DIA_Sentenza_AufsMaulAgain_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Sentenza_AufsMaul))
	{
		if (Npc_HasItems (self, itmi_gold) >= 50)
		|| (Npc_KnowsInfo (other, DIA_Jarvis_MissionKO))
		{
			return TRUE;
		};
	};
};
 
FUNC VOID DIA_Sentenza_AufsMaulAgain_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_AufsMaulAgain_15_00"); //¡Vuelve a ser la hora del reparto!
	AI_Output (self, other, "DIA_Sentenza_AufsMaulAgain_09_01"); //Si tú lo dices...
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};


// ************************************************************
// 			  				PERM
// ************************************************************

INSTANCE DIA_Sentenza_PERM (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 1;
	condition	= DIA_Sentenza_PERM_Condition;
	information	= DIA_Sentenza_PERM_Info;
	permanent	= TRUE;
	description = "¿Qué tal todo?";
};                       

FUNC INT DIA_Sentenza_PERM_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Sentenza_PERM_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_PERM_15_00"); //¿Qué tal todo?
	
	AI_Output (self, other, "DIA_Sentenza_PERM_09_01"); //Por aquí no viene mucha gente, pero hasta ahora todos han pagado mi peaje.
	if (Npc_HasItems (self, itmi_gold) < 50)
	{
		AI_Output (self, other, "DIA_Sentenza_PERM_09_02"); //Menos tú. (Sonríe torvamente).
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sentenza_PICKPOCKET (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 900;
	condition	= DIA_Sentenza_PICKPOCKET_Condition;
	information	= DIA_Sentenza_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Sentenza_PICKPOCKET_Condition()
{
	C_Beklauen (56, 65);
};
 
FUNC VOID DIA_Sentenza_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sentenza_PICKPOCKET);
	Info_AddChoice		(DIA_Sentenza_PICKPOCKET, DIALOG_BACK 		,DIA_Sentenza_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sentenza_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sentenza_PICKPOCKET_DoIt);
};

func void DIA_Sentenza_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sentenza_PICKPOCKET);
};
	
func void DIA_Sentenza_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sentenza_PICKPOCKET);
};


	






