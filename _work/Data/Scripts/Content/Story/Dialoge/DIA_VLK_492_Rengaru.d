///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rengaru_EXIT   (C_INFO)
{
	npc         = VLK_492_Rengaru;
	nr          = 999;
	condition   = DIA_Rengaru_EXIT_Condition;
	information = DIA_Rengaru_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rengaru_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rengaru_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rengaru_PICKPOCKET (C_INFO)
{
	npc			= VLK_492_Rengaru;
	nr			= 900;
	condition	= DIA_Rengaru_PICKPOCKET_Condition;
	information	= DIA_Rengaru_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Rengaru_PICKPOCKET_Condition()
{
	C_Beklauen (20, 5);
};
 
FUNC VOID DIA_Rengaru_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rengaru_PICKPOCKET);
	Info_AddChoice		(DIA_Rengaru_PICKPOCKET, DIALOG_BACK 		,DIA_Rengaru_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rengaru_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rengaru_PICKPOCKET_DoIt);
};

func void DIA_Rengaru_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rengaru_PICKPOCKET);
};
	
func void DIA_Rengaru_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rengaru_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hauab
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_Hauab		(C_INFO)
{
	npc			 = 	VLK_492_Rengaru;
	nr			 =  2;
	condition	 = 	DIA_Rengaru_Hauab_Condition;
	information	 = 	DIA_Rengaru_Hauab_Info;
	permanent	 =  TRUE;
	description	 = 	"�Qu� est�s haciendo aqu�?";
};
func int DIA_Rengaru_Hauab_Condition ()
{	
	if (Jora_Dieb != LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Rengaru_GOTYOU) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Rengaru_Hauab_Info ()
{
	AI_Output (other, self, "DIA_Rengaru_Hauab_15_00"); //�Qu� est�s haciendo aqu�?
	AI_Output (self, other, "DIA_Rengaru_Hauab_07_01"); //No s� por qu� iba a importante eso a ti. �Pi�rdete!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HalloDieb
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_HALLODIEB		(C_INFO)
{
	npc			 = 	VLK_492_Rengaru;
	nr			 =  2;
	condition	 = 	DIA_Rengaru_HALLODIEB_Condition;
	information	 = 	DIA_Rengaru_HALLODIEB_Info;
	permanent	 =  FALSE;
	description	 = 	"Jora dice que tienes su dinero...";
};
func int DIA_Rengaru_HALLODIEB_Condition ()
{
	if (Jora_Dieb == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Rengaru_HALLODIEB_Info ()
{
	AI_Output (other, self, "DIA_Rengaru_HALLODIEB_15_00"); //Jora dice que tienes su dinero...
	AI_Output (self, other, "DIA_Rengaru_HALLODIEB_07_01"); //�Maldici�n! �Me largo!

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"RunAway");  
};
///////////////////////////////////////////////////////////////////////
//	Info GotYou
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_GOTYOU		(C_INFO)
{
	npc			 = 	VLK_492_Rengaru;
	nr			 =  3;
	condition	 = 	DIA_Rengaru_GOTYOU_Condition;
	information	 = 	DIA_Rengaru_GOTYOU_Info;
	permanent	 =  FALSE;	
	description	 = 	"�Ya te tengo!";
};

func int DIA_Rengaru_GOTYOU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rengaru_HALLODIEB))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_GOTYOU_Info ()
{
	B_GivePlayerXP (XP_RengaruGotThief);
	
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_15_00"); //�Ya te tengo!
	AI_Output (self, other, "DIA_Rengaru_GOTYOU_07_01"); //�Qu� quieres de m�?
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_15_02"); //Le robaste a Jora a plena luz del d�a y �l incluso te vio hacerlo.
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_15_03"); //As� que he venido a decirte que eres un p�simo ladr�n y que...
	
	Info_ClearChoices (DIA_Rengaru_GOTYOU); 
	Info_AddChoice	(DIA_Rengaru_GOTYOU, "� merezco una parte del bot�n.", DIA_Rengaru_GOTYOU_Anteil );
	Info_AddChoice	(DIA_Rengaru_GOTYOU, "� ser� mejor que devuelvas el oro de Jora inmediatamente.", DIA_Rengaru_GOTYOU_YouThief );
	Info_AddChoice	(DIA_Rengaru_GOTYOU, "� y ahora, dime qui�n eres.", DIA_Rengaru_GOTYOU_WhoAreYou );
};
func void DIA_Rengaru_GOTYOU_YouThief ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_YouThief_15_00"); //� ser� mejor que devuelvas el oro de Jora inmediatamente.

	if (Npc_HasItems (self, Itmi_Gold) >= 1)
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_YouThief_07_01"); //�Aqu� est� la pasta, t�o! Pero ahora d�jame marchar. No lo volver� a hacer.
		B_GiveInvItems (self, other, ItMi_Gold, Npc_HasItems (self, ItMi_Gold));
	}
	else
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_YouThief_07_02"); //Ya no tengo el oro.
		
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)    
		{
			AI_Output (self, other, "DIA_Rengaru_GOTYOU_YouThief_07_03"); //�Pero por qu� te estoy contando esto? �A m� ya me has robado!
		};
	};	
	Info_ClearChoices	(DIA_Rengaru_GOTYOU);
};

func void DIA_Rengaru_GOTYOU_Anteil ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_Anteil_15_00"); //� Merezco una parte del bot�n.
	
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)    
	&& (Npc_HasItems (self, ItMi_Gold) < 1)
	{ 
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_07_01"); //�Ya cogiste todo lo que ten�a despu�s de dejarme sin sentido! �As� que d�jame marcharme!
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	}
	else
	{	//HACK MF. self/other - falsch gesprochen, kein Ersatz...
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_15_02"); //De acuerdo, parece que no tengo elecci�n. Compartir� la mitad contigo.
		
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
		Info_AddChoice		(DIA_Rengaru_GOTYOU, "No, �dame todo!", DIA_Rengaru_GOTYOU_Anteil_alles );
		Info_AddChoice		(DIA_Rengaru_GOTYOU, "De acuerdo, entonces dame la mitad.", DIA_Rengaru_GOTYOU_Anteil_GehtKlar );
	};
};
func void DIA_Rengaru_GOTYOU_Anteil_alles ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_Anteil_alles_15_00"); //No, �dame todo!
	
	if (Npc_HasItems (self, Itmi_Gold) >= 2)
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_alles_07_02"); //As� que me est�s desvalijando. Bueno, pues toma el oro. Y ahora, d�jame en paz.
		B_GiveInvItems (self, other, ItMi_Gold, Npc_HasItems (self, ItMi_Gold) );
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	}
	else 
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_alles_07_03"); //Te dar�a el oro, pero ya no lo tengo.
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	};
};

func void DIA_Rengaru_GOTYOU_Anteil_GehtKlar ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_Anteil_GehtKlar_15_00"); //De acuerdo, entonces dame la mitad.
	
	if B_GiveInvItems (self, other, ItMi_Gold, (Npc_HasItems (self, ItMi_Gold))/2 )
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_01"); //�Aqu� est� tu mitad! �Y ahora d�jame marcharme!
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_02"); //No me importar�a darte la mitad del oro, pero ya no lo tengo.
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	};
};
func void DIA_Rengaru_GOTYOU_WhoAreYou ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_WhoAreYou_15_00"); //� y ahora, dime qui�n eres.
	AI_Output (self, other, "DIA_Rengaru_GOTYOU_WhoAreYou_07_01"); //No soy m�s que un pobre desgraciado, que intenta sobrevivir como sea.
	AI_Output (self, other, "DIA_Rengaru_GOTYOU_WhoAreYou_07_02"); //�Qu� m�s puedo hacer? No puedo encontrar un trabajo en la ciudad...
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_WhoAreYou_15_03"); //� de acuerdo, entiendo. D�jame de lloriqueos.
};
///////////////////////////////////////////////////////////////////////
//	Info InKnast
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_INKNAST		(C_INFO)
{
	npc			 = 	VLK_492_Rengaru;
	nr 			 =  4;
	condition	 = 	DIA_Rengaru_INKNAST_Condition;
	information	 = 	DIA_Rengaru_INKNAST_Info;
	permanent 	 =  FALSE;
	description	 = 	"Deber�a delatarte a la milicia.";
};

func int DIA_Rengaru_INKNAST_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rengaru_GOTYOU))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_INKNAST_Info ()
{
	AI_Output (other, self, "DIA_Rengaru_INKNAST_15_00"); //Deber�a delatarte a la milicia.
	AI_Output (self, other, "DIA_Rengaru_INKNAST_07_01"); //�Qu� m�s quieres? �No me queda nada! �D�jame irme, t�o!
	
	Info_AddChoice	(DIA_Rengaru_INKNAST, "�Por qu� iba a querer hacer eso?", DIA_Rengaru_INKNAST_keinKnast );
	Info_AddChoice	(DIA_Rengaru_INKNAST, "Me encargar� de que te metan entre rejas.", DIA_Rengaru_INKNAST_Knast );
	Info_AddChoice	(DIA_Rengaru_INKNAST, "�Pi�rdete! �Y no asomes tu cara por aqu� nunca m�s!", DIA_Rengaru_INKNAST_HauAb );
};
func void DIA_Rengaru_INKNAST_HauAb ()
{
	AI_Output (other, self, "DIA_Rengaru_INKNAST_HauAb_15_00"); //�Pi�rdete! �Y no asomes tu cara por aqu� nunca m�s!
	AI_Output (self, other, "DIA_Rengaru_INKNAST_HauAb_07_01"); //�No lo lamentar�s! �Gracias, t�o!
	
	Npc_ExchangeRoutine	(self,"Start"); 	
	AI_StopProcessInfos (self);
	
	Diebesgilde_Okay = (Diebesgilde_Okay + 1);
};
func void DIA_Rengaru_INKNAST_Knast ()
{
	AI_Output (other, self, "DIA_Rengaru_INKNAST_Knast_15_00"); //Me encargar� de que te metan entre rejas.
	AI_Output (self, other, "DIA_Rengaru_INKNAST_Knast_07_01"); //(Cansado) No quiero m�s problemas. Si crees que es lo que debes hacer, adelante.
	AI_Output (self, other, "DIA_Rengaru_INKNAST_Knast_07_02"); //(Avisando) Pero ten cuidado. A mis amigos no les va a gustar lo que andas haciendo por aqu�...

	
	Rengaru_InKnast		= TRUE; 	
	
	AI_StopProcessInfos (self);
};

func void DIA_Rengaru_INKNAST_keinKnast ()
{
	AI_Output (other, self, "DIA_Rengaru_INKNAST_keinKnast_15_00"); //�Por qu� iba a querer hacer eso?
	AI_Output (self, other, "DIA_Rengaru_INKNAST_keinKnast_07_01"); //En la ciudad siempre es bueno conocer a la gente adecuada. Y estar en el lado adecuado.
	AI_Output (self, other, "DIA_Rengaru_INKNAST_keinKnast_07_02"); //Podr�a hablar bien de ti. No puedo ni debo decir nada m�s. El resto depende de ti.
};
///////////////////////////////////////////////////////////////////////
//	Info LastInfoKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_LastInfoKap1		(C_INFO)
{
	npc			 = 	VLK_492_Rengaru;
	nr			 =  6;
	condition	 = 	DIA_Rengaru_LastInfoKap1_Condition;
	information	 = 	DIA_Rengaru_LastInfoKap1_Info;
	permanent	 =  TRUE;	
	description	 = 	"�Va todo bien?";
};
func int DIA_Rengaru_LastInfoKap1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rengaru_INKNAST))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_LastInfoKap1_Info ()
{
	AI_Output (other, self, "DIA_Rengaru_LastInfoKap1_15_00"); //�Va todo bien?
	
	if (Rengaru_InKnast	== TRUE)
	{
		AI_Output (self, other, "DIA_Rengaru_LastInfoKap1_07_01"); //Adelante, b�rlate de m�. Tarde o temprano, recibir�s lo que te corresponde. �Lo juro!
	}
	else
	{
		AI_Output (self, other, "DIA_Rengaru_LastInfoKap1_07_02"); //�Qu� m�s quieres? �No rob� nada m�s! �En serio, t�o!
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rengaru_Zeichen   (C_INFO)
{
	npc         = VLK_492_Rengaru;
	nr          = 2;
	condition   = DIA_Rengaru_Zeichen_Condition;
	information = DIA_Rengaru_Zeichen_Info;
	permanent   = FALSE;
	description = "(Hacer la se�al de los ladrones)";
};

FUNC INT DIA_Rengaru_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	&& (Rengaru_InKnast == FALSE)
	&& Npc_KnowsInfo (other, DIA_Rengaru_GOTYOU)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rengaru_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	
	AI_Output (self, other, "DIA_Rengaru_Zeichen_07_00");//Ey, eres uno de los nuestros.
	AI_Output (self, other, "DIA_Rengaru_Zeichen_07_01");//D�jame decirte algo. Si pretendes vaciar bolsillos en la ciudad, �ten especial cuidado con los comerciantes!
	AI_Output (self, other, "DIA_Rengaru_Zeichen_07_02");//Son muy observadores con su g�nero. Pero puedo darte una pista.
	AI_Output (self, other, "DIA_Rengaru_Zeichen_07_03");//Prueba a sujetar el objeto deseado con una mano y a gesticular con la otra. Eso los distrae.
	
	B_RaiseAttribute(other, ATR_DEXTERITY, 1);
	Snd_Play ("LEVELUP"); 
};
