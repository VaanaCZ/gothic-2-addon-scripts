// ************************************************************
// 			  				   EXIT 
// ************************************************************

var int DIEGO_COMING;
// -------------------------

INSTANCE DIA_Gerbrandt_EXIT(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 999;
	condition	= DIA_Gerbrandt_EXIT_Condition;
	information	= DIA_Gerbrandt_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Gerbrandt_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gerbrandt_EXIT_Info()
{	
	if (DIEGO_COMING == TRUE)
	{
		DiegoNW = Hlp_GetNpc (PC_THIEF_NW);
				
		if ( Diego_IsOnBoard == FALSE)
		{
			B_StartOtherRoutine (DiegoNW,"GERBRANDT");
		};	
		//patch m.f. B_Startotherroutine raus und ersetzt durch Npc_exchange 
		
		Npc_ExchangeRoutine  (self,"NEWLIFE");
		B_StartOtherRoutine (GerbrandtsFrau,"NEWLIFE");
		
		DIEGO_COMING = 2; //Weder TRUE noch False
	};
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gerbrandt_PICKPOCKET (C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 900;
	condition	= DIA_Gerbrandt_PICKPOCKET_Condition;
	information	= DIA_Gerbrandt_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Robar su bolsa sería sencillo).";
};                       

FUNC INT DIA_Gerbrandt_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItSe_GoldPocket100) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	&& (DIEGO_COMING != TRUE) //NICHT, wenn Diego kommt
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Gerbrandt_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gerbrandt_PICKPOCKET);
	Info_AddChoice		(DIA_Gerbrandt_PICKPOCKET, DIALOG_BACK 		,DIA_Gerbrandt_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gerbrandt_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gerbrandt_PICKPOCKET_DoIt);
};

func void DIA_Gerbrandt_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSe_GoldPocket100, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Gerbrandt_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Gerbrandt_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gerbrandt_PICKPOCKET);
};
// ************************************************************
// 			  				  Hallo
// ************************************************************

INSTANCE DIA_Gerbrandt_Hello(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 5;
	condition	= DIA_Gerbrandt_Hello_Condition;
	information	= DIA_Gerbrandt_Hello_Info;
	permanent	= FALSE;
	description = "¿Qué estás haciendo aquí?";
};                       

FUNC INT DIA_Gerbrandt_Hello_Condition()
{
	if (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_PAL)
	&& (DIEGO_COMING == FALSE) //nur BEVOR Diego kommt
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Gerbrandt_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_15_00"); //¿Qué estás haciendo aquí?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_01"); //¿Y tú quién eres? Parece que eres nuevo y no tienes ni idea de lo que está pasando aquí.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_02"); //Me llaman Gerbrandt. Para ti: señor Gerbrandt, señor. ¿Está claro?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Entendido, Gerbrandt.",DIA_Gerbrandt_Hello_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Entiendo, Sr. Gerbrandt, caballero.",DIA_Gerbrandt_Hello_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_No_15_00"); //Entendido, Gerbrandt.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_01"); //Ten cuidado con esa bocaza. Será mejor que me demuestres un poco de respeto o vas a tener todo tipo de problemas aquí.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_02"); //Aquí mando yo. El que cause problemas tiene que responder ante mí y mejor que se largue de la ciudad a toda prisa, porque cuando haya terminado con él, deseará no haberme conocido.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_03"); //La mayoría de la gente del puerto trabaja para mí. Si piensas conseguir un trabajo, será mejor que mis recuerdos de ti sean agradables.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_15_00"); //Entiendo, Sr. Gerbrandt, señor.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_01"); //Al menos, no has tardado en ver de qué lado sopla el aire por aquí.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_02"); //En cuanto empiece a recuperarse el negocio, seguramente podré encontrar una utilidad para un chicarrón como tú.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_03"); //Serías un excelente maestro de almacén.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_04"); //¿Sabes leer?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"No.",DIA_Gerbrandt_Hello_Yes_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"No quiero trabajo.",DIA_Gerbrandt_Hello_NoJob);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Naturalmente.",DIA_Gerbrandt_Hello_Yes_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_No_15_00"); //No.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_01"); //Da igual, al menos podrás acarrear unos cuantos sacos.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_02"); //Si estoy satisfecho contigo, podría incluso ofrecerte un puesto fijo. Hay bastante trabajo por aquí.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_03"); //Bien, entonces te estaré esperando cuando los barcos regresen para atracar.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_NoJob ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_NoJob_15_00"); //No quiero trabajo.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_01"); //Te crees muy listo. Ten cuidado. Nadie consigue un trabajo aquí sin mi aprobación.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_02"); //Así que si sigues hablándome así, será mejor que te busques un camastro de paja infestado de bichos en el que dormir, porque eso será lo único que podrás permitirte.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_03"); //Llegará el momento en el que me ruegues que te dé un trabajo.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_Yes ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_Yes_15_00"); //Naturalmente.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01"); //Bien, bien. El personal entrenado es difícil de encontrar.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02"); //¿Cuáles son tus referencias?
	AI_Output (other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03"); //¿Referencias?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04"); //Muy bien. Me acordaré de tu cara. Cuando el comercio se recupere, ven a verme. Podría tener un trabajo para ti entonces.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

// ************************************************************
// 			  	Perm
// ************************************************************

FUNC VOID B_GErbrandt_PissOff ()
{
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_00"); //¿De qué va eso? ¿Te estás cachondeando de mí?
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_01"); //Tú y tu colega Diego ya habéis causado suficientes problemas.
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_02"); //¡Déjame en paz!
	
	//Patch m.f. Wenn diego kommt und er wird gefragt, geht er nicht los, weil losgehen steht in exit info und durch diesen Ai_Stop wird das umgangen
	if (DIEGO_COMING != TRUE) //NICHT, wenn Diego kommt
	{
		AI_StopProcessInfos (self);
	};
};

INSTANCE DIA_Gerbrandt_Perm(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 800;
	condition	= DIA_Gerbrandt_Perm_Condition;
	information	= DIA_Gerbrandt_Perm_Info;
	permanent	= TRUE;
	description	= "¿Alguna novedad?";
};                       

FUNC INT DIA_Gerbrandt_Perm_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Gerbrandt_Hello))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Gerbrandt_Perm_Info()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Perm_15_00"); //¿Alguna novedad?
	
	if (Kapitel <= 2)
	{
		if (hero.guild != GIL_KDF)
		&& (hero.guild != GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_01"); //La gente como tú no tiene nada que hacer por estos lares. Aquí vive gente respetable, no mendigos ni delincuentes.
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_02"); //Si alguna vez consigues hacerte rico y respetable, podrías ser mejor bienvenido aquí.
		}
		else
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_03"); //No puedo quejarme, honorable señor.
		};
	}
	else if (Kapitel >= 3)
	{
		if (MIS_DiegosResidence != LOG_SUCCESS)
		{
			if (hero.guild != GIL_KDF)
			&& (hero.guild != GIL_PAL)
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_04"); //Ya conozco a los de tu calaña. Simplemente no sabes cuál es tu sitio.
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_05"); //Hablaré con el gobernador acerca de las medidas de seguridad adecuadas para la parte alta de la ciudad.
			}
			else
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_06"); //Eso no le interesa a nadie más que a mí. ¡Estoy ocupado!
			};
		}
		else
		{
			B_Gerbrandt_PissOff ();
		};
	};
};

//################################
//##
//##	Kapitel 3
//##
//################################

INSTANCE DIA_Gerbrandt_GreetingsFromDiego(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 10;
	condition	= DIA_Gerbrandt_GreetingsFromDiego_Condition;
	information	= DIA_Gerbrandt_GreetingsFromDiego_Info;
	permanent	= FALSE;
	description	= "Diego envía saludos.";
};                       

FUNC INT DIA_Gerbrandt_GreetingsFromDiego_Condition()
{
	
	if (MIS_DiegosResidence == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_DiegosLetter_MIS) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Gerbrandt_GreetingsFromDiego_Info()
{
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_00"); //Diego envía saludos.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01"); //(Asustado) ¿Qué? ¿Quién? ¿Qué Diego?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_02"); //Y quiere que te dé esta carta.
	
	B_GiveInvItems (other,self,ItWr_DiegosLetter_MIS,1);
	B_UseFakeScroll ();
	
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03"); //(Agitado) Eso no puede ser. No. ¡Estoy perdido!
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04"); //(Temeroso) Entonces, ¿está en la ciudad?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_05"); //¿Quién?
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06"); //¡Diego, naturalmente!
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_07"); //Sí, voy a reunirme con él aquí en breve.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08"); //(Desesperado, para sí mismo) Entonces, esto es el fin. Todo está perdido.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09"); //No tengo tiempo que perder. Necesito salir de aquí. Deprisa. Si me encuentra, estoy acabado.
	
	MIS_DiegosResidence = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_DiegosResidence);
	
	DIEGO_COMING = TRUE;
};
