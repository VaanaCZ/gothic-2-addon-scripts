// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Buster_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_EXIT_Condition;
	information	= DIA_Buster_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Buster_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Buster_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				   Hallo 
// ************************************************************

INSTANCE DIA_Buster_Hello (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_Hello_Condition;
	information	= DIA_Buster_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       

FUNC INT DIA_Buster_Hello_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST) //Wegen News - Info kommt nicht mehr gut, wenn schonmal gepr�gelt
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Buster_Hello_13_00");	//�Qu� tenemos aqu�? �No te conozco de otro sitio?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Si t� lo dices. Voy a ver al terrateniente." 	,DIA_Buster_Hello_GoingToFarm);
	Info_AddChoice		(DIA_Buster_Hello, "�Qui�n quiere saberlo?"									,DIA_Buster_Hello_WhoAreYou);
};

func void DIA_Buster_Hello_WhoAreYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WhoAreYou_15_00"); //�Qui�n quiere saberlo?
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_01"); //Soy Buster, �uno de los mercenarios de Lee!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_02"); //Y T� har�as bien en ser un poco m�s simp�tico conmigo, �o te arrancar� la piel!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_03"); //De acuerdo, �qu� buscas aqu�?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "No es de tu incumbencia."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "�Conozco a Lee!"											,DIA_Buster_Hello_IKnowLee);
	Info_AddChoice		(DIA_Buster_Hello, "Solo soy un viajero que va a ver al propietario." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_IKnowLee()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IKnowLee_15_00"); //�Conozco a Lee!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_01"); //�Todo el mundo conoce a Lee! Eso no significa nada, compa�ero. Ahora mismo, �est�s hablando CONMIGO!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_02"); //Y, �ad�nde te diriges?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "No es de tu incumbencia."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Solo soy un viajero que va a ver al propietario." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_NotYourBusiness()
{
	AI_Output (other,self ,"DIA_Buster_Hello_NotYourBusiness_15_00"); //No es de tu incumbencia.
	AI_Output (self ,other,"DIA_Buster_Hello_NotYourBusiness_13_01"); //Nadie me habla as�, �gusano! �Creo que va siendo hora de que te den una tunda!
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_GoingToFarm()
{
	AI_Output (other,self ,"DIA_Buster_Hello_GoingToFarm_15_00"); //Lo que t� digas. Voy a ver al terrateniente.
	AI_Output (self ,other,"DIA_Buster_Hello_GoingToFarm_13_01"); //Desde luego... Mmm, no me pareces tan peligroso.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "�Quieres descubrirlo t� mismo?"								,DIA_Buster_Hello_WannaTestIt);
	Info_AddChoice		(DIA_Buster_Hello, "Yo tambi�n he matado a una bestia o dos."	,DIA_Buster_Hello_SlewBeasts);
	Info_AddChoice		(DIA_Buster_Hello, "Tenlo por seguro." 									,DIA_Buster_Hello_ImNoDanger);
};

func void DIA_Buster_Hello_ImNoDanger()
{
	AI_Output (other,self ,"DIA_Buster_Hello_ImNoDanger_15_00"); //Tienes raz�n.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_01"); //(Satisfecho) S�, con los a�os aprendes a darte cuenta de esas cosas, colega.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_02"); //Por aqu� tenemos que luchar a menudo con los orcos. O con los guardias de la ciudad. Son unos capullines bastante insistentes. (Se r�e).
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "�Te refieres a ORCOS de verdad? �Esas cosas enormes?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "�Y?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Impresionante." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_SlewBeasts()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SlewBeasts_15_00"); //Yo tambi�n he matado a una bestia o dos.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_01"); //�Ja! (Se r�e) Probablemente hayas pisado unos cuantos gorgojos en los campos o hayas sacado a un par de ratas de sus agujeros.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_02"); //�Aqu� nos enfrentamos a orcos! Bien, s�, y a esos mierdecillas de la guardia de la ciudad (se r�e burlonamente).
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "�Te refieres a ORCOS de verdad? �Esas cosas enormes?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "�Y?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Impresionante." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_WannaTestIt()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_00"); //�Quieres descubrirlo t� mismo?
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_01"); //�Madre m�a! Me he metido con el tipo equivocado, �verdad?
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_02"); //Podr�as decirlo as�.
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_03"); //Entonces venga, ens��ame lo que sabes.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_Impressive()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Impressive_15_00"); //Impresionante.
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_01"); //(Se r�e) ��ste es nuestro negocio, chico! �Incluso fabricamos nuestras armas y armaduras!
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_02"); //Nos enfrentamos a la muerte cada d�a. Pero un paleto como t� no sabe a qu� me refiero.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "�Supongo que tendr� que ense�arte cu�nto s� de esto!"	,DIA_Buster_Hello_LetMeShowYou);
	Info_AddChoice		(DIA_Buster_Hello, "�Lo que t� digas!"									,DIA_Buster_Hello_IfYouSaySo);
};

func void DIA_Buster_Hello_IfYouSaySo()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IfYouSaySo_15_00"); //�Lo que t� digas!
	AI_Output (self ,other,"DIA_Buster_Hello_IfYouSaySo_13_01"); //(Con un gru�ido aburrido) Mu�vete, pipiolo.

	AI_StopProcessInfos	(self);
};

func void DIA_Buster_Hello_LetMeShowYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_LetMeShowYou_15_00"); //�Supongo que tendr� que ense�arte cu�nto s� de esto!
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_01"); //Entonces, �has iniciado una revuelta campesina en solitario?
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_02"); //Muy bien, a ver qu� sabes hacer.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_SoWhat()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SoWhat_15_00"); //�Y?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_01"); //(Bufa) Como si supieras de qu� hablo. Crees que eres tremendamente fuerte, �verdad?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_02"); //(Enfadado) �Quiz� va siendo hora de que alguien te d� una lecci�n!
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "�Cuando quieras!"						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "Solo bromeaba..."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_RealOrcs()
{
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_00"); //�Te refieres a ORCOS de verdad? �Esos bichos enormes?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_01"); //(Suspira) Me refiero... �Espera un momento! �Intentas tomarme el pelo?
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_02"); //(Sonriendo) Nada m�s lejos de mi intenci�n.
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_03"); //�Gusano! (tontamente agresivo) Te la est�s buscando de verdad, �eh?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_04"); //�Venga, h�roe, ens��ame qu� sabes hacer!
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "�Cuando quieras!"						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "Solo bromeaba..."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_Whenever()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Whenever_15_00"); //�Cuando quieras!
	AI_Output (self ,other,"DIA_Buster_Hello_Whenever_13_01"); //�Ac�rcate m�s, amiguito!
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_JustJoking()
{
	AI_Output (other,self ,"DIA_Buster_Hello_JustJoking_15_00"); //Solo bromeaba...
	AI_Output (self ,other,"DIA_Buster_Hello_JustJoking_13_01"); //S�, claro, �lo que t� digas! �L�rgate de aqu�!
	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				 FightNone
// ************************************************************

INSTANCE DIA_Buster_FightNone (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_FightNone_Condition;
	information	= DIA_Buster_FightNone_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Buster_FightNone_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Buster_Hello))
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Buster_FightNone_Info()
{
	AI_Output (self, other,"DIA_Buster_FightNone_13_00"); //�Qu� quieres, enclenque?
};


// ************************************************************
// 		  				 Wanna Join		
// ************************************************************

INSTANCE DIA_Buster_Duell (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 3;
	condition	= DIA_Buster_Duell_Condition;
	information	= DIA_Buster_Duell_Info;
	permanent	= TRUE;
	description = "�Te desaf�o a un duelo!";
};                       

FUNC INT DIA_Buster_Duell_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Duell_Info()
{	
	AI_Output (other, self,"DIA_Buster_Duell_15_00"); //�Te desaf�o a un duelo!
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_01"); //�Ja, ja! No vas a dejar correr esto, �eh? De acuerdo, �ven aqu�!
	}
	else //WON oder CANCEL
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_02"); //�Quieres probar otra vez? Molesto y peque�o tocapelotas... Vale, �ven aqu�!
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output (self, other,"DIA_Buster_Duell_13_03"); //�Pero no salgas corriendo otra vez!
		};
	};
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};


// ************************************************************
// 		  				 Wanna Join		
// ************************************************************
INSTANCE DIA_Buster_WannaJoin (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_WannaJoin_Condition;
	information	= DIA_Buster_WannaJoin_Info;
	permanent	= TRUE;
	description = "�Quiero unirme a los mercenarios!";
};                       

FUNC INT DIA_Buster_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Buster_Duell == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_WannaJoin_Info()
{	
	AI_Output (other, self,"DIA_Buster_WannaJoin_15_00"); //�Quiero unirme a los mercenarios!
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_01"); //Cualquiera que pegue tan duro como t� no deber�a tener problemas por aqu�.
		}
		else //FIGHT_WON
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_02"); //No eres el mejor de los guerreros, pero desde luego, no eres cobarde.
		};
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_03"); //Mi voto no cuenta mucho ya que no llevo aqu� demasiado tiempo, pero cuando Lee me pregunte, votar� por ti.
		Buster_Duell = TRUE;
		Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
		B_LogEntry (TOPIC_SLDRespekt,"Como he derrotado a Buster, no le importa que me una a los mercenarios.");
	}
	else //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_04"); //�T�? No recuerdo que nunca se permitiera que un cobarde se uniera a los mercenarios...
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_05"); //Si huyes de los duelos, �no llegar�s muy lejos por aqu�!
		};
	};
};

// ************************************************************
// 		  				 Mehr �ber S�ldner		
// ************************************************************
var int Buster_SentenzaTip;

INSTANCE DIA_Buster_OtherSld (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_OtherSld_Condition;
	information	= DIA_Buster_OtherSld_Info;
	permanent	= FALSE;
	description = "Quiero saber m�s de los mercenarios y de esta regi�n.";
};                       

FUNC INT DIA_Buster_OtherSld_Condition()
{
	if ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
		{
				return TRUE;	
		};
};
 
FUNC VOID DIA_Buster_OtherSld_Info()
{	
	AI_Output (other, self,"DIA_Buster_OtherSld_15_00"); //Quiero saber m�s de los mercenarios y de esta regi�n.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_01"); //No te puedo decir mucho de esta zona. Deber�as preguntar a los granjeros.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_02"); //Y en lo que respecta a los mercenarios, tenemos una regla muy simple: si puedes mantenerte firme, eres de los nuestros.
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_03"); //Creo que est�s hecho de la pasta necesaria como para ser uno de los nuestros.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_04"); //Pero no deber�as dejar que se te subiera a la cabeza la suerte que tuviste durante nuestro �ltimo encuentro.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_05"); //Hay muchos tipos en las granjas que son un poco mejores que yo...
		AI_Output (self, other,"DIA_Buster_OtherSld_13_06"); //Sentenza, por ejemplo. Custodia la entrada de la granja. Hagas lo que hagas, no te pelees con �l.
		Buster_SentenzaTip = TRUE;
	}
	else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		//NICHTS (s.o.)
	}
	else  //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_07"); //�Pero por qu� estoy dici�ndote esto a TI, cobarde?
		AI_StopProcessInfos (self);		
	};
};

// ************************************************************
// 		  				About Sentenza		
// ************************************************************
var int Buster_GoldZumBrennen;
var int Buster_Bonus;

INSTANCE DIA_Buster_AboutSentenza (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_AboutSentenza_Condition;
	information	= DIA_Buster_AboutSentenza_Info;
	permanent	= FALSE;
	description = "�Qu� pasa con Sentenza?";
};                       

FUNC INT DIA_Buster_AboutSentenza_Condition()
{
	if (Buster_SentenzaTip == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_AboutSentenza_Info()
{	
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_00"); //�Qu� pasa con Sentenza?
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_01"); //Intentar� sacarte algo de oro cuando llegues a la granja. Lo hace con todos los nuevos.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_02"); //Y si fuera t�, pagar�a. Eso es lo que hice cuando me toc� a m�. Y lo bueno es que despu�s vot� por m�.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_03"); //Un buen gesto se merece otro, es lo que dijo. Perd� todo mi oro en el trato, pero tampoco era demasiado. Al final me mereci� la pena.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_04"); //Una vez vi como le dio una paliza a uno que decidi� NO pagarle.
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_05"); //Gracias por el consejo.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_06"); //Desde luego. �Podr�a valer algo para ti?

	Info_ClearChoices (DIA_Buster_AboutSentenza);
	Info_AddChoice (DIA_Buster_AboutSentenza, "No.", DIA_Buster_AboutSentenza_No);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Aqu� tienes 5 piezas de oro.", DIA_Buster_AboutSentenza_Give);
};

func void DIA_Buster_AboutSentenza_Give()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_Give_15_00"); //Aqu� tienes 5 piezas de oro.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_Give_13_01"); //Gracias, hombre. Parece que al final podr� tomarme unas cuantas esta noche. No se me va a olvidar.
	Buster_GoldZumBrennen = TRUE;
	Buster_Bonus = 50;
	Info_ClearChoices (DIA_Buster_AboutSentenza);
};

func void DIA_Buster_AboutSentenza_No()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_No_15_00"); //No.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_No_13_01"); //Me lo figuraba.
	Info_ClearChoices (DIA_Buster_AboutSentenza);
};

// ************************************************************
// 		  				 LeeLeader		
// ************************************************************

INSTANCE DIA_Buster_LeeLeader (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_LeeLeader_Condition;
	information	= DIA_Buster_LeeLeader_Info;
	permanent	= FALSE;
	description = "Lee es el l�der de los mercenarios, �verdad?";
};                       

FUNC INT DIA_Buster_LeeLeader_Condition()
{
	if (Buster_Duell == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_LeeLeader_Info()
{	
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_00"); //Lee es el l�der de los mercenarios, �verdad?
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_01"); //Eso es. Oye, �ya me acuerdo de qu� te conozco! T� tambi�n estabas en la colonia.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_02"); //(Suspira) S�, all� estaba.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_03"); //No te vi cuando ocurri� la gran explosi�n. Ni tampoco en los momentos previos.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_04"); //Tuve otros problemas.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_05"); //Entonces te has perdido muchas cosas. La situaci�n ha cambiado bastante desde que est�bamos juntos en la trena.
};


// ************************************************************
// 		  				 WhatHappened		
// ************************************************************

INSTANCE DIA_Buster_WhatHappened (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_WhatHappened_Condition;
	information	= DIA_Buster_WhatHappened_Info;
	permanent	= FALSE;
	description = "�Qu� ocurri� con los mercenarios en la colonia?";
};                       

FUNC INT DIA_Buster_WhatHappened_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Buster_LeeLeader))
	&& ((hero.guild != GIL_SLD)&& (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_WhatHappened_Info()
{	
	AI_Output (other, self,"DIA_Buster_WhatHappened_15_00"); //�Qu� fue de los mercenarios en la colonia?
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_01"); //Cuando la barrera desapareci�, Lee nos sac� de la colonia. Dijo que no nos pasar�a nada si permanec�amos juntos. Y ten�a raz�n.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_02"); //No tardamos en encontrar aqu� un buen hogar. El terrateniente nos paga por encargarnos de la milicia de la ciudad.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_03"); //Y la mayor�a de nosotros lo habr�amos hecho encantados sin que nos pagaran.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_04"); //Pero Onar nos da de comer a todos y podemos esperar hasta que se presente una buena oportunidad de salir de esta isla del demonio.
};


//**************************************
//			TrainingGold
//************************************** 
INSTANCE DIA_Buster_Teach (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 8;
	condition	= DIA_Buster_Teach_Condition;
	information	= DIA_Buster_Teach_Info;
	permanent	= TRUE;
	description = "�Me puedes ense�ar a luchar mejor?";
};                       

FUNC INT DIA_Buster_Teach_Condition()
{	
	if (Npc_GetTalentSkill (other, NPC_TALENT_1H) <= 60) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_Teach_Info()
{	
	AI_Output (other, self, "DIA_Buster_Teach_15_00"); //�Me puedes ense�ar a luchar mejor?
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_01"); //Podr�a darte un consejo o dos...
	}
	else 
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_02"); //No eres tan tonto como pareces. De acuerdo, te ense�ar� lo que s�. Luego puede que tengas una oportunidad contra m�...
	};
	
	if (BusterLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Buster me puede ense�ar las t�cnicas del combate con armas de una mano.");
		BusterLOG = TRUE;
	};
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
};

FUNC VOID DIA_Buster_Teach_Back ()
{
	Info_ClearChoices (DIA_Buster_Teach);
};

FUNC VOID DIA_Buster_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);
	
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
};

FUNC VOID DIA_Buster_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);
	
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Buster_KAP3_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP3_EXIT_Condition;
	information	= DIA_Buster_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Shadowbeasts
///////////////////////////////////////////////////////////////////////
instance DIA_Buster_SHADOWBEASTS		(C_INFO)
{
	npc		 	= Sld_802_Buster;
	nr		 	= 30;
	condition	= DIA_Buster_SHADOWBEASTS_Condition;
	information	= DIA_Buster_SHADOWBEASTS_Info;
	permanent	= FALSE;
	important	= TRUE;
};

func int DIA_Buster_SHADOWBEASTS_Condition ()
{
	if ((Kapitel == 3) || (Kapitel == 4))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				return TRUE;
		};
};

func void B_DIA_Buster_SHADOWBEASTS_OK ()
{
	AI_StopProcessInfos (self);
};

func void DIA_Buster_SHADOWBEASTS_Info ()
{
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_00"); //Eh, t�, �amiguito!
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_01"); //�Qu� es lo que quieres?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_02"); //Estos �ltimos d�as he estado pensando en pod�amos ganar algo de dinero r�pido en este vertedero.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_03"); //�Y?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_04"); //Creo que me he topado con una oportunidad de ganar dinero r�pido.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_05"); //Un mercader de la ciudad soltar�a mucha pasta por una cosa.

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "�Qui�n es ese mercader del que me hablas?", DIA_Buster_SHADOWBEASTS_wer );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "�De qu� va esto?", DIA_Buster_SHADOWBEASTS_was );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "�Por qu� me cuentas esto?", DIA_Buster_SHADOWBEASTS_ich );

};
func void DIA_Buster_SHADOWBEASTS_ich ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_00"); //�Por qu� me cuentas esto?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_01"); //Yo no puedo hacerlo. Tengo que quedarme aqu� y vigilar a esas ovejas idiotas.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_02"); //Te refieres a los granjeros.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_03"); //Eso es lo que dec�a.

};
func void DIA_Buster_SHADOWBEASTS_was ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_15_00"); //�De qu� va esto?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_01"); //El mercader afirma que podr�a sacarle un buen dinero a los cuernos de bestia de sombra.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_02"); //Alguien tendr�a que ir al bosque a encargarse de las bestias. Y ah� es donde entras t�.

	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "�Cu�nto se puede ganar?", DIA_Buster_SHADOWBEASTS_was_wieviel );
};
func void DIA_Buster_SHADOWBEASTS_was_wieviel ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_00"); //�Cu�nto se puede ganar?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_01"); //Una buena pasta, te lo aseguro. Deber�a haber suficiente para los dos.
	if (Buster_GoldZumBrennen == TRUE)
	{
		AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_02"); //Y como me diste oro en aquella ocasi�n, te har� un precio especial.
	};
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_03"); //�Tiene buena pinta! Cuando me agencie algunos cuernos te avisar�.
	MIS_Buster_KillShadowbeasts_DJG = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Buster_KillShadowbeasts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Buster_KillShadowbeasts, LOG_RUNNING);
	B_LogEntry (TOPIC_Buster_KillShadowbeasts,"Buster ofrecer� un buen precio por cada cuerno de bestia de las sombras que le lleve."); 

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
};
func void DIA_Buster_SHADOWBEASTS_wer ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_wer_15_00"); //�Qui�n es ese mercader del que me hablas?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_01"); //De eso nada, compa�ero. Tonto tendr�a que ser para desvelarte qui�n es mi contacto. �Quieres jug�rmela?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_02"); //O haces el trato CONMIGO o no lo haces, �comprendido?

};

///////////////////////////////////////////////////////////////////////
//	Info BringTrophyShadowbeast
///////////////////////////////////////////////////////////////////////
instance DIA_Buster_BringTrophyShadowbeast		(C_INFO)
{
	npc		 = 	Sld_802_Buster;
	nr		 = 	2;
	condition	 = 	DIA_Buster_BringTrophyShadowbeast_Condition;
	information	 = 	DIA_Buster_BringTrophyShadowbeast_Info;
	permanent	 = 	TRUE;

	description	 = 	"Acerca de los cuernos de bestias de sombra...";
};

func int DIA_Buster_BringTrophyShadowbeast_Condition ()
{
	if (MIS_Buster_KillShadowbeasts_DJG == LOG_RUNNING)
	&& ((Npc_HasItems (other,ItAt_ShadowHorn))||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				return TRUE;
		};
};

var int BusterTrophyShadowbeastCounter;

func void DIA_Buster_BringTrophyShadowbeast_Info ()
{
	if ((Kapitel >= 5))
	{
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_00"); //Mi mercader de la ciudad est� fuera de juego.
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_15_01"); //�Qu� quiere decir eso?
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_02"); //Est� muerto. Te puedes quedar los cuernos. Ahora no sabr�a qu� hacer con ellos.
		MIS_Buster_KillShadowbeasts_DJG = LOG_SUCCESS; //Joly: Feierabend ab Kapitel 5!!!!!!!
		B_GivePlayerXP (XP_Ambient);
	}
	else if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
	{
		AI_Output			(other, self, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03"); //�C�mo se destripa a una bestia de sombra?
		AI_Output			(self, other, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04"); //�No lo sabes? Hombre, esperaba m�s de ti.
	
		Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
		Info_AddChoice	(DIA_Buster_BringTrophyShadowbeast, "Ya volver� para ello.", DIA_Buster_BringTrophyShadowbeast_back );
		Info_AddChoice	(DIA_Buster_BringTrophyShadowbeast, B_BuildLearnString ("Ens��ame.",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Buster_BringTrophyShadowbeast_teach );
	}
	else 
	{
		var int BusterTrophyShadowbeastCount;
		var int XP_BringBusterTrophyShadowbeast;
		var int XP_BringBusterTrophyShadowbeasts;
		var int BustersBusterTrophyShadowbeastOffer;
		var int BusterTrophyShadowbeastGeld;
	
		BusterTrophyShadowbeastCount = Npc_HasItems(other, ItAt_ShadowHorn);
		XP_BringBusterTrophyShadowbeast = 	(Shadowbeast.level * XP_PER_VICTORY);			
		BustersBusterTrophyShadowbeastOffer = Value_ShadowHorn + Buster_Bonus; //Joly: Wert ohne Handelmultiplier!!!!!!!!!!!!!
		
	
		if (BusterTrophyShadowbeastCount == 1)
			{
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_05"); //Tengo un cuerno de bestia de sombra.
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeast);
				B_GiveInvItems (other, self, ItAt_ShadowHorn,1);
				BusterTrophyShadowbeastCounter = BusterTrophyShadowbeastCounter + 1;
			}
			else
			{
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_06"); //Tengo varios cuernos de bestia de sombra para tu mercader.
	
				B_GiveInvItems (other, self, ItAt_ShadowHorn,  BusterTrophyShadowbeastCount);
	
				XP_BringBusterTrophyShadowbeasts = (BusterTrophyShadowbeastCount * XP_BringBusterTrophyShadowbeast);
				BusterTrophyShadowbeastCounter = (BusterTrophyShadowbeastCounter + BusterTrophyShadowbeastCount); 
	
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeasts);
			};
	
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_07"); //Estupendo. D�melos. Y consigue m�s. A saber durante cu�nto tiempo querr� el mercader estas cosas.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_08"); //Aqu� est� tu parte.
	
		BusterTrophyShadowbeastGeld	= (BusterTrophyShadowbeastCount * BustersBusterTrophyShadowbeastOffer);
	
		CreateInvItems (self, ItMi_Gold, BusterTrophyShadowbeastGeld); 
		B_GiveInvItems (self, other, ItMi_Gold, BusterTrophyShadowbeastGeld);
	};

};
func void DIA_Buster_BringTrophyShadowbeast_teach ()
{
	AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_teach_15_00"); //Ens��ame.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_01"); //Entonces escucha. Te cargas a la bestia de sombra y luego sujetas su cuerno con tu mano derecha, tan fuerte como puedas.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_02"); //Pinchas con el cuchillo en su frente y cortas alrededor del cuerno.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_03"); //Entonces haces palanca con el cuchillo para separar el cuerno del cr�neo y te lo metes en el bolsillo.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_04"); //Bien. Y luego me lo traes. No deber�a resultarte complicado.
		};		
	Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
};

func void DIA_Buster_BringTrophyShadowbeast_back ()
{
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_back_15_00"); //Volver�.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_back_13_01"); //Eso espero.
		Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Buster_KAP4_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP4_EXIT_Condition;
	information	= DIA_Buster_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 		  				 	PERM Kapitel 4	
// ************************************************************

INSTANCE DIA_Buster_Perm4 (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_Perm4_Condition;
	information	= DIA_Buster_Perm4_Info;
	permanent	= TRUE;
	description = "�Qu� opinas de eso de los cazadores de drag�n?";
};                       

FUNC INT DIA_Buster_Perm4_Condition()
{
	if (Kapitel >= 4) 
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Perm4_Info()
{	
	AI_Output (other, self,"DIA_Buster_Perm4_15_00"); //�Qu� opinas de eso de los cazadores de dragones?
	AI_Output (self, other,"DIA_Buster_Perm4_13_01"); //Los chicos podr�an conseguir mucho oro, si no estiran la pata.
	AI_Output (self, other,"DIA_Buster_Perm4_13_02"); //Por mi parte, prefiero quedarme con Lee.
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Buster_KAP5_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP5_EXIT_Condition;
	information	= DIA_Buster_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Buster_KAP6_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP6_EXIT_Condition;
	information	= DIA_Buster_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Buster_PICKPOCKET (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 900;
	condition	= DIA_Buster_PICKPOCKET_Condition;
	information	= DIA_Buster_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Buster_PICKPOCKET_Condition()
{
	C_Beklauen (34, 60);
};
 
FUNC VOID DIA_Buster_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Buster_PICKPOCKET);
	Info_AddChoice		(DIA_Buster_PICKPOCKET, DIALOG_BACK 		,DIA_Buster_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Buster_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Buster_PICKPOCKET_DoIt);
};

func void DIA_Buster_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Buster_PICKPOCKET);
};
	
func void DIA_Buster_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Buster_PICKPOCKET);
};








































