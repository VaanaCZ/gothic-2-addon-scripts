///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pedro_DI_EXIT   (C_INFO)
{
	npc         = NOV_600_Pedro_DI;
	nr          = 999;
	condition   = DIA_Pedro_DI_EXIT_Condition;
	information = DIA_Pedro_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pedro_DI_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pedro_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Verräter
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_YOU		(C_INFO)
{
	npc			 = 	NOV_600_Pedro_DI;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_DI_YOU_Condition;
	information	 = 	DIA_Pedro_DI_YOU_Info;
	
	description	 = 	"Verräter!";
	
};
func int DIA_Pedro_DI_YOU_Condition ()
{	
	return TRUE;
};

func void DIA_Pedro_DI_YOU_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_00"); //Verräter! Endlich habe ich dich gefunden.

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_01"); //Glaub ja nicht, nur weil ich dem Corps der Paladine angehöre, lass ich bei dir Gnade walten.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_02"); //Bei uns Söldnern haben viele ihre Seele an Beliar verkauft und trotzdem verspürte ich oft Skrupel, sie einfach abzuschlachten, aber du Drecksau bist eine Ausnahme.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_03"); //Von allen seelenlosen Dreckskerlen, denen ich je begegnet bin, bist du mit Abstand der Schlimmste. Du bist eine Schande für unseren Orden.
		};

	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_04"); //Ich sollte dich gleich hier töten.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_05"); //Halte ein. Ich bitte dich. Sie haben mich verhext. Ich hätte doch niemals aus freiem Willen das Kloster Innos' verraten.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_06"); //Du weißt ja gar nicht, was ich die letzten Tage durchgestanden habe. Sie haben mir diese Stimme in den Kopf gepflanzt. Ich konnte mich nicht dagegen wehren.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_07"); //Der Orkische Oberst hat mich tagelang verhört. Er hat mich ständig geschlagen. Verschone mich. Mich trifft keine Schuld. Du musst mir glauben.
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Erzähl´ mir, was du weißt.", DIA_Pedro_DI_YOU_verschon );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Gar nichts muß ich. Ich werde dich jetzt töten.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Nenn mir nur einen Grund, warum ich dir das glauben sollte?", DIA_Pedro_DI_YOU_grund );
	if (MIS_Gorax_KillPedro == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Pedro_DI_YOU, "Serpentes gab mir den Auftag, dich zu töten", DIA_Pedro_DI_YOU_Serpentes );
	};
};

func void DIA_Pedro_DI_YOU_grund ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_grund_15_00"); //Nenn mir nur einen Grund, warum ich dir glauben sollte.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_grund_09_01"); //(flehend) Lass mich leben. Ich kann dir auch Informationen geben, die dir helfen werden, hier wieder herauszukommen. Du musst mich anhören.

};
var int PedroDI_Flee;
func void DIA_Pedro_DI_YOU_tot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_tot_15_00"); //Gar nichts muss ich. Ich werde dich jetzt töten.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_tot_09_01"); //Bei allen Göttern ...

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Ship");
	B_Attack (self, other, AR_NONE, 1);
	PedroDI_Flee = LOG_RUNNING;
};

func void DIA_Pedro_DI_YOU_Serpentes ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_Serpentes_15_00"); //Serpentes gab mir den Auftrag, dich zu töten, und ich pflege in der Regel meine Aufträge zu erledigen.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_Serpentes_09_01"); //(flehend) Bitte, nein. Das kannst du nicht machen. Ich kann noch von großem Nutzen für dich sein. Das musst du doch erkennen.

	B_GivePlayerXP (XP_Pedro_SerpentesMission);
	MIS_Gorax_KillPedro = LOG_SUCCESS;	//Joly: bei erfolgreicher Mission in folgenden Dialogen muss heißen; if ((Npc_IsDead(PedroDI)) && (MIS_Gorax_KillPedro == LOG_SUCCESS))

};

func void DIA_Pedro_DI_YOU_verschon ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_verschon_15_00"); //Erzähl mir, was du weißt.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_verschon_09_01"); //(erleichtert) Ja, natürlich. Ich sag dir alles, was du willst. Unter einer Bedingung. Du musst mich von dieser verfluchten Insel herunterschaffen, hörst du?
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Gar nichts muß ich. Ich werde dich jetzt töten.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "In Ordnung. Folge mir, ich bringe dich zu meinem Schiff.", DIA_Pedro_DI_YOU_FollowShip );

};

var int MIS_Pedro_DI_FollowShip;
func void DIA_Pedro_DI_YOU_FollowShip ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_FollowShip_15_00"); //In Ordnung. Folge mir, ich bringe dich zum Schiff.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_FollowShip_09_01"); //Ich danke dir. Du wirst es nicht bereuen.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FollowShip");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_Pedro_DI_FollowShip = LOG_RUNNING;

};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedAtShip
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_ArrivedAtShip		(C_INFO)
{
	npc		 = 	NOV_600_Pedro_DI;
	nr		 = 	4;
	condition	 = 	DIA_Pedro_DI_ArrivedAtShip_Condition;
	information	 = 	DIA_Pedro_DI_ArrivedAtShip_Info;

	description	= "Da sind wir!";	
};

func int DIA_Pedro_DI_ArrivedAtShip_Condition ()
{
	if (Npc_GetDistToWP(self,"SHIP")<6000) 
	&& (MIS_Pedro_DI_FollowShip == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Pedro_DI_ArrivedAtShip_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_00"); //Da sind wir!
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_01"); //Ein stattliches Schiff hast du da. Du bist wahrlich ein großer Feldherr.
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_02"); //Hör auf zu schwafeln. Erzähl mir, was ich hören will.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_03"); //Äh, natürlich. Womit soll ich beginnen?
	
	Info_ClearChoices	(DIA_Pedro_DI_ArrivedAtShip);
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Ich habe genug gehört.", DIA_Pedro_DI_ArrivedAtShip_Back );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Wie komme ich ins Innere der Insel?", DIA_Pedro_DI_ArrivedAtShip_Innere );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Welche Unholde treiben sich noch auf dieser Insel herum?", DIA_Pedro_DI_ArrivedAtShip_Monster );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Wie war das mit dem Orkischen Oberst?", DIA_Pedro_DI_ArrivedAtShip_OrkOberst );


};
func void DIA_Pedro_DI_ArrivedAtShip_OrkOberst ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00"); //Wie war das mit dem Orkischen Oberst?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01"); //Er hat mir den letzten Funken Hoffnung genommen, jemals meine Heimat wiederzusehen.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02"); //Seit ich hierher gekommen bin, fragt er mich aus über die strategischen Stellungen der Paladine in Khorinis.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03"); //Natürlich konnte ich ihm nicht viel dazu sagen. Wie auch, verdammt? Ich bin ein Novize des Feuers.
	
	if ((Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI)))
	{
		Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Der Orkische Oberst ist tot.", DIA_Pedro_DI_ArrivedAtShip_OberstTot );
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Monster ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Monster_15_00"); //Welche Unholde treiben sich noch auf dieser Insel herum?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_01"); //Tagsüber sieht man oft Echsenmenschen zur Küste laufen. Sie tragen meistens sehr große Eier mit sich herum.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_02"); //Ich bekam nicht sehr viel mit in meiner Zelle, aber ich glaube, sie machen sich bereit, die Insel zu verlassen.
};

func void DIA_Pedro_DI_ArrivedAtShip_Innere ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Innere_15_00"); //Wie komme ich ins Innere der Insel?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_01"); //Es gibt einen geheimen Gang im Thronsaal des Orkischen Obersts.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_02"); //Ich bin jedes Mal dorthin geschleppt worden, wenn er mich verhören wollte. Da habe ich es gesehen.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_03"); //Einer der Schamanen hat einen Mechanismus in Gang gesetzt, indem er an den Fackeln, die in dem Saal an den Wänden hängen, gezogen hat.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_04"); //Mmh. Ich glaube, er hat erst die linke und dann die rechte Fackel gezogen, aber genau weiß ich das nicht mehr.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_05"); //Im hinteren Bereich öffnete sich plötzlich ein geheimer Gang, der bis tief in den Berg hineinführt.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_06"); //Wo dieser Gang endet, weiß ich nicht.

};

func void DIA_Pedro_DI_ArrivedAtShip_OberstTot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00"); //Der Orkische Oberst ist tot.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01"); //Tot? Gepriesen sei Innos. Ich werde seine hässliche Fratze niemals mehr vergessen.

};

func void DIA_Pedro_DI_ArrivedAtShip_Back ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Back_15_00"); //Ich habe genug gehört. Such dir einen Platz auf meinem Schiff. Ich habe noch einen Job zu erledigen.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Back_09_01"); //Möge die Macht Innos' dich begleiten. Ich werde für dich beten.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Ship");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_PERM		(C_INFO)
{
	npc		 = 	NOV_600_Pedro_DI;
	nr		 = 	5;
	condition	 = 	DIA_Pedro_DI_PERM_Condition;
	information	 = 	DIA_Pedro_DI_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Müde?";
};
var int PedroDI_TalkNomore;
func int DIA_Pedro_DI_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pedro_DI_YOU))
	&& (PedroDI_TalkNomore == FALSE)
		{
				return TRUE;
		};
};
func void DIA_Pedro_DI_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_00"); //Müde?

	if (Npc_GetDistToWP(self,"SHIP_DECK_05")<1000) 
	{	
		if (PedroDI_Flee == LOG_RUNNING)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_01"); //Soll ich dir vielleicht noch ein Kissen bringen?
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_02"); //Verschone mich, bitte. Ich werde auch ganz still hier sitzen und keinen Mucks machen.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_03"); //Mmh.
			B_GivePlayerXP (XP_Ambient);
			PedroDI_Flee = LOG_SUCCESS;
		}
		else if (Npc_IsDead(Dragon_Undead))
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_04"); //Ich bin völlig fertig.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_05"); //Leg dich in die Koje. Wir sind bald wieder auf See.
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_06"); //Danke, Mann. Ich dachte schon, ich kippe hier noch von der Bank. Gute Nacht.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PedroDI_TalkNomore = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_07"); //Es geht schon. Danke.
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_08"); //Bitte. Lass mich leben!
		AI_StopProcessInfos (self);
	};
};

