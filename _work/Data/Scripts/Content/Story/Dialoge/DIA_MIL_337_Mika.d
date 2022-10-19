///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mika_EXIT   (C_INFO)
{
	npc         = Mil_337_Mika;
	nr          = 999;
	condition   = DIA_Mika_EXIT_Condition;
	information = DIA_Mika_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Mika_EXIT_Condition()
{
	if Kapitel <=2
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Mika_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Refuse Talk wenn Lares am Start
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mika_Refuse   (C_INFO)
{
	npc         = Mil_337_Mika;
	nr          = 1;
	condition   = DIA_Mika_Refuse_Condition;
	information = DIA_Mika_Refuse_Info;
	permanent   = TRUE;
	important 	= TRUE;
};

FUNC INT DIA_Mika_Refuse_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Lares.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mika_Refuse_Info()
{
	B_Say(self, other, "$NOTNOW");
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WOHIN		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr    	 = 4;     
	condition	 = 	DIA_Mika_WOHIN_Condition;
	information	 = 	DIA_Mika_WOHIN_Info;
	important	 = 	TRUE;
};

func int DIA_Mika_WOHIN_Condition ()
{
	if (Lares.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mika_WOHIN_Info ()
{
	AI_Output			(self, other, "DIA_Mika_WOHIN_12_00"); //Hey, hey. Nicht so schnell. Alleine hier drau�en herum zu spazieren ist gef�hrlich. Wo kommst du denn her?

	Info_ClearChoices	(DIA_Mika_WOHIN);

	Info_AddChoice	(DIA_Mika_WOHIN, "Das geht dich nichts an.", DIA_Mika_WOHIN_weg );
	Info_AddChoice	(DIA_Mika_WOHIN, "Von einem der Bauernh�fe.", DIA_Mika_WOHIN_Bauern );
	Info_AddChoice	(DIA_Mika_WOHIN, "Aus der Stadt.", DIA_Mika_WOHIN_stadt );
};
func void DIA_Mika_WOHIN_stadt ()
{
	AI_Output			(other, self, "DIA_Mika_WOHIN_stadt_15_00"); //Aus der Stadt!
	AI_Output			(self, other, "DIA_Mika_WOHIN_stadt_12_01"); //So so. Was streifst du dann hier drau�en so weit vor der sch�tzenden Stadtmauer herum?

	Info_ClearChoices	(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_Bauern ()
{
	AI_Output			(other, self, "DIA_Mika_WOHIN_Bauern_15_00"); //Von einem der Bauernh�fe.
	AI_Output			(self, other, "DIA_Mika_WOHIN_Bauern_12_01"); //Ein Bauer also. Hmm. Dann solltest du besser nicht alleine �ber die gef�hrlichen Feldwege spazieren. Wer wei�, wer dir hier auflauern k�nnte.

	Info_ClearChoices	(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_weg ()
{
	AI_Output			(other, self, "DIA_Mika_WOHIN_weg_15_00"); //Geht dich nichts an.
	AI_Output			(self, other, "DIA_Mika_WOHIN_weg_12_01"); //Wie du meinst. Aber jammere nachher nicht, wenn sie dir die Haut abziehen. Sch�nen Tag noch.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info WasGefaehrlich
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WASGEFAEHRLICH		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	5;
	condition	 = 	DIA_Mika_WASGEFAEHRLICH_Condition;
	information	 = 	DIA_Mika_WASGEFAEHRLICH_Info;

	description	 = 	"Was ist hier drau�en so gef�hrlich?";
};

func int DIA_Mika_WASGEFAEHRLICH_Condition ()
{
	return TRUE;
};

func void DIA_Mika_WASGEFAEHRLICH_Info ()
{
	AI_Output			(other, self, "DIA_Mika_WASGEFAEHRLICH_15_00"); //Was ist hier drau�en so gef�hrlich?
	AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_01"); //Vieles.
	if (other.protection[PROT_EDGE]	< ITAR_Leather_L.protection [PROT_EDGE])	//Joly: kleiner als die Lederr�stung
	{
		AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_02"); //Da w�ren zum einen die Banditen. So eine lausige Figur wie dich verputzen die zum Fr�hst�ck.
		AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_03"); //Wenn dich die Banditen nicht erwischen, dann besorgen das die wilden Tiere im Wald oder die herumstreunenden S�ldner.
		AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_04"); //Also, besorg dir erstmal eine vern�nftige R�stung, bevor du raus gehst.
	};
	AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_05"); //Ich wette, dass du nach der n�chsten Wegbiegung schon nach meiner Hilfe schreist.
	
};

///////////////////////////////////////////////////////////////////////
//	Info waskostetHilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WASKOSTETHILFE		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	6;
	condition	 = 	DIA_Mika_WASKOSTETHILFE_Condition;
	information	 = 	DIA_Mika_WASKOSTETHILFE_Info;

	description	 = 	"Mal angenommen, ich w�rde deine Hilfe in Anspruch nehmen.";
};

func int DIA_Mika_WASKOSTETHILFE_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Mika_WASGEFAEHRLICH))
				{
						return TRUE;
				};
};

func void DIA_Mika_WASKOSTETHILFE_Info ()
{
	AI_Output			(other, self, "DIA_Mika_WASKOSTETHILFE_15_00"); //Mal angenommen, ich w�rde deine Hilfe in Anspruch nehmen. Was w�rde mich das kosten?
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_12_01"); //Ich bin nur ein bescheidener Diener des K�nigs und w�rde nur sehr ungern einen kleinen hilflosen B�rger des Reiches schr�pfen.
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_12_02"); //Aber wei�t du, wenn du mich so fragst, h�tte ich nichts gegen eine kleine Starthilfe f�r unsere zuk�nftigen Gesch�ftsbeziehungen einzuwenden.
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_12_03"); //10 Goldm�nzen sollten f�r den Anfang reichen. Was meinst du?

	Info_ClearChoices	(DIA_Mika_WASKOSTETHILFE);

	Info_AddChoice	(DIA_Mika_WASKOSTETHILFE, "Ich denke dar�ber nach.", DIA_Mika_WASKOSTETHILFE_nochnicht );
	Info_AddChoice	(DIA_Mika_WASKOSTETHILFE, "Warum nicht? Hier hast du die 10 M�nzen.", DIA_Mika_WASKOSTETHILFE_ja );

};

func void DIA_Mika_WASKOSTETHILFE_ja ()
{
	AI_Output			(other, self, "DIA_Mika_WASKOSTETHILFE_ja_15_00"); //Warum nicht? Hier hast du die 10 M�nzen.

	if (B_GiveInvItems (other, self, ItMi_Gold,10))
			{
				AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_01"); //Gro�artig. Wenn du meine Hilfe brauchst, wei�t du ja, wo du mich findest.
				AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_02"); //Aber tu mir bitte einen Gefallen, komm mir nicht mit irgendwelchen Lappalien. Das kann ich nicht leiden, h�rst du??
				
				Mika_Helps = TRUE;
			}
		else
			{
				AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_03"); //Du hast das Geld �berhaupt nicht. Ich glaube, du denkst besser noch mal dar�ber nach, ob du meine Hilfe wirklich willst.
			};
	AI_StopProcessInfos (self);
};

func void DIA_Mika_WASKOSTETHILFE_nochnicht ()
{
	AI_Output			(other, self, "DIA_Mika_WASKOSTETHILFE_nochnicht_15_00"); //Ich denke dar�ber nach.
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_nochnicht_12_01"); //Wie du willst. Ich w�nsche dir einen sch�nen Tod.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Ueberlegt
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_UEBERLEGT		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	7;
	condition	 = 	DIA_Mika_UEBERLEGT_Condition;
	information	 = 	DIA_Mika_UEBERLEGT_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ich hab�s mir �berlegt. Ich zahle dir die 10 Goldm�nzen.";
};

func int DIA_Mika_UEBERLEGT_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Mika_WASKOSTETHILFE))
	&&	(Mika_Helps == FALSE))
	{
		return TRUE;
	};
};
func void DIA_Mika_UEBERLEGT_Info ()
{
	AI_Output			(other, self, "DIA_Mika_UEBERLEGT_15_00"); //Ich hab's mir �berlegt. Ich zahle dir die 10 Goldm�nzen.

	if (B_GiveInvItems (other, self, ItMi_Gold,10))
		{
			AI_Output			(self, other, "DIA_Mika_UEBERLEGT_12_01"); //Wunderbar. Lieber sp�t als nie. Und nun?
			
			Mika_Helps = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Mika_UEBERLEGT_12_02"); //(ver�rgert) Komm wieder, wenn du das Geld hast.
			AI_StopProcessInfos (self);	
		};
};

///////////////////////////////////////////////////////////////////////
//	Info HILFE
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_HILFE		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	8;
	condition	 = 	DIA_Mika_HILFE_Condition;
	information	 = 	DIA_Mika_HILFE_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ich brauche deine Hilfe.";
};

func int DIA_Mika_HILFE_Condition ()
{
	if (Mika_Helps == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Mika_HILFE_Info ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_15_00"); //Ich brauche deine Hilfe.
	AI_Output			(self, other, "DIA_Mika_HILFE_12_01"); //Wenn's unbedingt sein muss. Was ist los?

	Info_ClearChoices	(DIA_Mika_HILFE);
	
	Info_AddChoice	(DIA_Mika_HILFE, "Ich werde von Banditen verfolgt.", DIA_Mika_HILFE_schongut );
	Info_AddChoice	(DIA_Mika_HILFE, "Ich werde von Monstern angegriffen.", DIA_Mika_HILFE_monster );

	if (!Npc_IsDead (Alvares)) 
	&& (!Npc_IsDead (Engardo))
	&& ( (Akils_SLDstillthere == TRUE) || (Npc_KnowsInfo (other, DIA_Sarah_Bauern)) )
	{
		Info_AddChoice	(DIA_Mika_HILFE, "Der Bauer Akil wird von S�ldnern angegriffen.", DIA_Mika_HILFE_Akil );
	};
};

func void DIA_Mika_HILFE_Akil ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_Akil_15_00"); //Der Bauer Akil wird von S�ldnern angegriffen.
	AI_Output			(self, other, "DIA_Mika_HILFE_Akil_12_01"); //(aufgeregt) Was? Das Lumpenpack treibt sich auf Akils Hof herum? Dann lass uns keine Zeit verlieren. Folge mir.

	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	B_GivePlayerXP (Xp_Ambient);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Mika will mir helfen, das kleine S�ldnerproblem auf Akils Hof zu l�sen."); 

	Npc_ExchangeRoutine	(self,"Akil"); 
};

func void DIA_Mika_HILFE_monster ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_monster_15_00"); //Ich werde von Monstern angegriffen.
	AI_Output			(self, other, "DIA_Mika_HILFE_monster_12_01"); //Im Moment sehe ich aber gar keine Monster. Das bildest du dir sicher blo� ein.

	AI_StopProcessInfos (self);	
};

func void DIA_Mika_HILFE_schongut ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_schongut_15_00"); //Ich werde von Banditen verfolgt.
	AI_Output			(self, other, "DIA_Mika_HILFE_schongut_12_01"); //Tats�chlich? Wo sind sie denn? Wenn du verfolgt wirst, m�sste ich doch wenigstens einen von ihnen sehen, oder?

	AI_StopProcessInfos (self);	
};



///////////////////////////////////////////////////////////////////////
//	Info Zack
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_Zack		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	8;
	condition	 = 	DIA_Mika_Zack_Condition;
	information	 = 	DIA_Mika_Zack_Info;
	important	 = 	TRUE;

};

func int DIA_Mika_Zack_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_FARM2_PATH_03")<500)
	&& ((!Npc_IsDead (Alvares))||(!Npc_IsDead (Engardo)))	
		{
			return TRUE;
		};
};

func void DIA_Mika_Zack_Info ()
{
	AI_Output			(self, other, "DIA_Mika_Zack_12_00"); //Jetzt pass mal auf, wie das geht.
	Info_AddChoice	(DIA_Mika_Zack, DIALOG_ENDE, DIA_Mika_Zack_los );
};
func void DIA_Mika_Zack_los ()
{
	AI_StopProcessInfos (self);
	//Joly: B_attack funzt hier nicht und ist auch nicht n�tig!!!!!!!!!!!
	if(!Npc_IsDead (Alvares))
	{
		Alvares.aivar[AIV_EnemyOverride] = FALSE;
	};	
	if (!Npc_IsDead (Engardo))
	{
		Engardo.aivar[AIV_EnemyOverride] = FALSE;
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info WiederNachHause
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WIEDERNACHHAUSE		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr 		 = 9;
	condition	 = 	DIA_Mika_WIEDERNACHHAUSE_Condition;
	information	 = 	DIA_Mika_WIEDERNACHHAUSE_Info;
	important	 = 	TRUE;
};

func int DIA_Mika_WIEDERNACHHAUSE_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_FARM2_PATH_03")<10000)
	&& 	(Npc_IsDead (Alvares))
	&&  (Npc_IsDead (Engardo))	
	{
		return TRUE;
	};
};

func void DIA_Mika_WIEDERNACHHAUSE_Info ()
{
	AI_Output			(self, other, "DIA_Mika_WIEDERNACHHAUSE_12_00"); //So. Die Geschichte hat sich wohl erledigt. Ich geh dann mal.

	AI_StopProcessInfos (self);		
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"Start"); 
	B_GivePlayerXP (Xp_Ambient);
};

//############################################
//##
//##	Kapitel 3
//##
//############################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mika_Kap3_EXIT   (C_INFO)
{
	npc         = Mil_337_Mika;
	nr          = 999;
	condition   = DIA_Mika_Kap3_EXIT_Condition;
	information = DIA_Mika_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Mika_Kap3_EXIT_Condition()
{
	if Kapitel >= 3
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Mika_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//***************************************************
//		Perm Kap3
//***************************************************

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mika_Kap3u4u5_PERM   (C_INFO)
{
	npc         = Mil_337_Mika;
	nr          = 39;
	condition   = DIA_Mika_Kap3u4u5_PERM_Condition;
	information = DIA_Mika_Kap3u4u5_PERM_Info;
	permanent   = TRUE;
	description = "Alles ruhig?";
};

FUNC INT DIA_Mika_Kap3u4u5_PERM_Condition()
{
	if  (Kapitel >= 3)
	&& 	(Npc_KnowsInfo(other, DIA_Mika_WOHIN))
	&& 	(Npc_IsDead (Alvares))
	&&  (Npc_IsDead (Engardo))	
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Mika_Kap3u4u5_PERM_Info()
{
	AI_Output (other,self ,"DIA_Mika_Kap3u4u5_PERM_15_00"); //Alles ruhig?
	AI_Output (self ,other,"DIA_Mika_Kap3u4u5_PERM_12_01"); //Du lebst ja immer noch. Alle Achtung.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Mika_PICKPOCKET (C_INFO)
{
	npc			= Mil_337_Mika;
	nr			= 900;
	condition	= DIA_Mika_PICKPOCKET_Condition;
	information	= DIA_Mika_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Mika_PICKPOCKET_Condition()
{
	C_Beklauen (65, 75);
};
 
FUNC VOID DIA_Mika_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Mika_PICKPOCKET);
	Info_AddChoice		(DIA_Mika_PICKPOCKET, DIALOG_BACK 		,DIA_Mika_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Mika_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Mika_PICKPOCKET_DoIt);
};

func void DIA_Mika_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Mika_PICKPOCKET);
};
	
func void DIA_Mika_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Mika_PICKPOCKET);
};


