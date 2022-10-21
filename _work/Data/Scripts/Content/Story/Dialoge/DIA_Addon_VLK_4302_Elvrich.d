///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Elvrich_EXIT   (C_INFO)
{
	npc         = VLK_4302_Addon_Elvrich;
	nr          = 999;
	condition   = DIA_Addon_Elvrich_EXIT_Condition;
	information = DIA_Addon_Elvrich_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Elvrich_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Elvrich_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Elvrich_PICKPOCKET (C_INFO)
{
	npc			= VLK_4302_Addon_Elvrich;
	nr			= 900;
	condition	= DIA_Addon_Elvrich_PICKPOCKET_Condition;
	information	= DIA_Addon_Elvrich_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Elvrich_PICKPOCKET_Condition()
{
	C_Beklauen (62, 110);
};
 
FUNC VOID DIA_Addon_Elvrich_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Elvrich_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Elvrich_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Elvrich_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Elvrich_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Elvrich_PICKPOCKET_DoIt);
};

func void DIA_Addon_Elvrich_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Elvrich_PICKPOCKET);
};
	
func void DIA_Addon_Elvrich_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Elvrich_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info BanditsThere
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_BanditsThere		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_BanditsThere_Condition;
	information	 = 	DIA_Addon_Elvrich_BanditsThere_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};
var int DIA_Addon_Elvrich_BanditsThere_NoPerm;
func int DIA_Addon_Elvrich_BanditsThere_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (DIA_Addon_Elvrich_BanditsThere_NoPerm == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_BanditsThere_Info ()
{
	if (Npc_IsDead(BDT_10307_Addon_RangerBandit_M))
	&& (Npc_IsDead(BDT_10308_Addon_RangerBandit_L))	
	&& (Npc_IsDead(BDT_10309_Addon_RangerBandit_L))	
	&& (Npc_IsDead(BDT_10310_Addon_RangerBandit_M))	
	{
		AI_Output	(self, other, "DIA_Addon_Elvrich_BanditsThere_04_00"); //Dem Himmel sei Dank. Die Banditen sind erledigt. Du hast mein Leben gerettet.
		DIA_Addon_Elvrich_BanditsThere_NoPerm = TRUE;
		self.aivar[AIV_NoFightParker] = FALSE;
	}
	else
	{
		B_Say (self, other, "$NOTNOW");
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Wer
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_Wer		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_Wer_Condition;
	information	 = 	DIA_Addon_Elvrich_Wer_Info;

	description	 = 	"Wer bist du?";
};

func int DIA_Addon_Elvrich_Wer_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Elvrich_Wer_Info ()
{
	AI_Output (other, self, "DIA_Addon_Elvrich_Wer_15_00"); //Wer bist du?
	AI_Output (self, other, "DIA_Addon_Elvrich_Wer_04_01"); //Mein Name ist Elvrich. Ich komme aus der Stadt.
	if (MIS_Thorben_BringElvrichBack == LOG_RUNNING)
	{
		AI_Output (other, self, "DIA_Addon_Elvrich_Wer_15_02"); //Meister Thorben hat mir erzählt, dass du verschwunden bist.
	};
	AI_Output (self, other, "DIA_Addon_Elvrich_Wer_04_03"); //Diese miesen Kerle haben mich hierher verschleppt und mich hier gefangen gehalten.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_MissingPeople_Condition;
	information	 = 	DIA_Addon_Elvrich_MissingPeople_Info;

	description	 = 	"In der Stadt werden eine Menge Leute vermisst.";
};

func int DIA_Addon_Elvrich_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_Wer))
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_MissingPeople_15_00"); //In der Stadt werden eine Menge Leute vermisst.
	AI_Output	(self, other, "DIA_Addon_Elvrich_MissingPeople_04_01"); //Von Vermissten weiß ich nichts. Ich kann dir nur das sagen, was MIR widerfahren ist.
};

///////////////////////////////////////////////////////////////////////
//	Info WhatExactly
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_WhatExactly		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_WhatExactly_Condition;
	information	 = 	DIA_Addon_Elvrich_WhatExactly_Info;

	description	 = 	"Was genau ist dir passiert?";
};

func int DIA_Addon_Elvrich_WhatExactly_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_Wer))
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_WhatExactly_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_WhatExactly_15_00"); //Was genau ist dir passiert?
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhatExactly_04_01"); //Ich war auf dem Weg zum Treffpunkt, den ich mit meinem Mädchen ausgemacht hatte.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhatExactly_04_02"); //Ihr Name ist Lucia. Wir hatten den Plan, in die Berge zu verschwinden. Weg von der Stadt und allen, die dort leben.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhatExactly_04_03"); //Ich war gerade am Treffpunkt angekommen, als plötzlich einige dieser Banditen aus dem Dickicht kamen und uns beide gefangen nahmen.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhatExactly_04_04"); //Ich hab mich natürlich gewehrt, aber es half nichts. Es waren einfach zu viele. Du hast sie nicht zufälligerweise gesehen?

	Info_ClearChoices	(DIA_Addon_Elvrich_WhatExactly);
	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Was wollten die Banditen von euch?", DIA_Addon_Elvrich_WhatExactly_Want );
	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Erzähl mir von Lucia.", DIA_Addon_Elvrich_WhatExactly_lucia );
};
func void DIA_Addon_Elvrich_WhatExactly_Want ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_Want_15_00"); //Was wollten die Banditen von euch?
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Want_04_01"); //Manchmal konnte ich sie nachts belauschen. Ich habe nicht alles verstanden, aber ich glaube, sie wollten uns versklaven.

	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Wohin wollten sie euch bringen?", DIA_Addon_Elvrich_WhatExactly_Pirates );
};
func void DIA_Addon_Elvrich_WhatExactly_Pirates ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_Pirates_15_00"); //Wohin wollten sie euch bringen?
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_01"); //An einen Ort hier irgendwo auf der Insel Khorinis. Aber ich denke, man kommt nicht ohne Schiff dorthin.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_02"); //Sie haben mich zu einer Anlegestelle an die Küste gebracht. Dort lagerten einige Piraten.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_03"); //Einer der Banditen ging voraus, um mit den Piraten zu verhandeln. Es gab ein heftiges Streitgespräch zwischen ihnen.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_04"); //Ich glaube, dass der Bandit mit mir zusammen von den Piraten übergesetzt werden wollte.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_05"); //Die Piraten sind aber nicht darauf eingegangen. Kurzerhand haben sich die Banditen hierher zurück gezogen und seitdem saßen wir hier herum.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_06"); //Sie schienen ziemlich ratlos zu sein. Und dann bist du gekommen.
	
	Elvrich_SCKnowsPirats = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Elvrich der Lehrling des Tischler Thorben aus Khorinis wurde von Banditen entführt. Die Piraten scheinen mit den Banditen unter einer Decke zu stecken."); 
	
	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Piraten in Khorinis?", DIA_Addon_Elvrich_WhatExactly_Here );
	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Wo ist diese Anlegestelle der Piraten?", DIA_Addon_Elvrich_WhatExactly_pirat );
};
func void DIA_Addon_Elvrich_WhatExactly_Here ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_Here_15_00"); //Piraten in Khorinis?
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Here_04_01"); //Ich weiß nicht sehr viel über sie. Bei der Anlegestelle habe ich das erste Mal überhaupt einen von ihnen gesehen.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Here_04_02"); //Sie halten sich immer im Hintergrund. Jeder von ihnen ist ein gesuchter Verbrecher in Khorinis.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Here_04_03"); //Sie haben Angst vor dem Galgen. Deswegen wirst du niemals einen von ihnen in der Stadt antreffen.
};
func void DIA_Addon_Elvrich_WhatExactly_lucia ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_lucia_15_00"); //Erzähl mir von Lucia.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_lucia_04_01"); //Ein Mädchen aus dem Hafenviertel. Sie hat für diesen Fiesling Bromor gearbeitet. Sie ist sehr hübsch.
};
func void DIA_Addon_Elvrich_WhatExactly_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_pirat_15_00"); //Wo ist diese Anlegestelle der Piraten?
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_pirat_04_01"); //Sie ist nicht weit vom Hafen von Khorinis entfernt.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_pirat_04_02"); //Wenn du auf der Kaimauer stehst und auf's Meer hinaus schaust, musst du nur in ein Boot steigen und rechts die Küste entlang fahren.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_pirat_04_03"); //Die erste kleine Bucht, die du dort findest, das ist die Anlegestelle, die ich meine.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Um zur Anlegestelle der Piraten zu kommen, muss man zum Hafen von Khorinis. Wenn man auf der Kaimauer steht und auf's Meer hinaus schaut, muss man rechts die Küste entlang schwimmen."); 

	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, DIALOG_BACK, DIA_Addon_Elvrich_WhatExactly_Back );
};
func void DIA_Addon_Elvrich_WhatExactly_Back ()
{
	Info_ClearChoices	(DIA_Addon_Elvrich_WhatExactly);
};

///////////////////////////////////////////////////////////////////////
//	Info Bromor
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_Bromor		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_Bromor_Condition;
	information	 = 	DIA_Addon_Elvrich_Bromor_Info;

	description	 = 	"Bromor sagte, Lucia hätte eine goldene Schale mitgehen lassen...";
};

func int DIA_Addon_Elvrich_Bromor_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly))
	&& (MIS_Bromor_LuciaStoleGold == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_Bromor_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_Bromor_15_00"); //Bromor sagte, Lucia hätte eine goldene Schale mitgehen lassen ...
	AI_Output	(self, other, "DIA_Addon_Elvrich_Bromor_04_01"); //Tja. Wenn Lucia wirklich Bromor bestohlen hat, dann werden die Banditen ihr das Ding abgenommen haben.

	Log_CreateTopic (TOPIC_Addon_BromorsGold, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BromorsGold,"Bromors goldene Schale befindet sich jetzt wahrscheinlich in dem Besitz der Banditen im nördlichen Wald hinter Sekobs Hof."); 
};

///////////////////////////////////////////////////////////////////////
//	Info WhereIsLucia
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_WhereIsLucia		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_WhereIsLucia_Condition;
	information	 = 	DIA_Addon_Elvrich_WhereIsLucia_Info;

	description	 = 	"Wo ist Lucia jetzt?";
};

func int DIA_Addon_Elvrich_WhereIsLucia_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly))
	&& (MIS_LuciasLetter != LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_WhereIsLucia_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_WhereIsLucia_15_00"); //Wo ist Lucia jetzt?
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhereIsLucia_04_01"); //Auf der großen Feldkreuzung vor Onars Hof haben sich unsere Weg getrennt.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhereIsLucia_04_02"); //Die Banditen haben Lucia in den Wald hinter Sekobs Hof verschleppt.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhereIsLucia_04_03"); //Innos möge sie beschützen.

	Log_CreateTopic (TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Lucia,"Lucia wurde von den Banditen in den Wald hinter Sekobs Bauernhof irgendwo im Norden verschleppt."); 

	SC_KnowsLuciaCaughtByBandits = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info FernandosWaffen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_FernandosWaffen		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_FernandosWaffen_Condition;
	information	 = 	DIA_Addon_Elvrich_FernandosWaffen_Info;

	description	 = 	"Hatten die Banditen, die dich gefangen nahmen, Waffen geliefert bekommen?";
};

func int DIA_Addon_Elvrich_FernandosWaffen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly))
	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)	
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_FernandosWaffen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_FernandosWaffen_15_00"); //Wurden den Banditen, die dich gefangen hielten, Waffen geliefert?
	AI_Output	(self, other, "DIA_Addon_Elvrich_FernandosWaffen_04_01"); //Oh ja. So einen Haufen, dass sie sie fast gar nicht schleppen konnten.
	AI_Output	(self, other, "DIA_Addon_Elvrich_FernandosWaffen_04_02"); //Sie sind mit dem ganzen Kram in Richtung Sekobs Hof verschwunden.
	B_GivePlayerXP (XP_Ambient);

	Log_CreateTopic (TOPIC_Addon_BanditTrader, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditTrader, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BanditTrader,"Die Spur führt mich in den Wald hinter Sekobs Bauernhof irgendwo im Norden. Dort soll es Banditen geben, die eine Menge Waffen geliefert bekommen haben."); 
};

///////////////////////////////////////////////////////////////////////
//	Info LuciaLetter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_LuciaLetter		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	4;
	condition	 = 	DIA_Addon_Elvrich_LuciaLetter_Condition;
	information	 = 	DIA_Addon_Elvrich_LuciaLetter_Info;

	description	 = 	"Ich habe einen Brief von deiner Lucia gefunden.";
};

func int DIA_Addon_Elvrich_LuciaLetter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly))
	&& (Npc_HasItems (other,ItWr_LuciasLoveLetter_Addon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_LuciaLetter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_LuciaLetter_15_00"); //Ich habe einen Brief von deiner Lucia gefunden.
	AI_Output	(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_01"); //(erregt) Was? Gib ihn her!
	B_UseFakeScroll ();
	AI_Output	(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_02"); //(verzweifelt) NEIN! Das glaub ich einfach nicht. Nein. Ich kann das nicht glauben.
	AI_Output	(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_03"); //(verzweifelt) Es kann nicht sein, dass sie mich einfach zurück lässt.
	AI_Output	(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_04"); //(verzweifelt) Nimm den Brief wieder mit. Ich will ihn nicht. Ich glaube fest daran, dass sie eines Tages wieder zu mir zurück kommt.
	
	Log_CreateTopic (TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Lucia,"Elvrich will nicht glauben, dass Lucia mit den Banditen freiwillig mitgegangen sein soll. Er hofft trotz ihrem eindeutigen Abschiedsbrief immer noch auf ihre Rückkehr."); 

	B_GivePlayerXP (XP_Addon_LuciasLetter);
	MIS_LuciasLetter = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info WasNun
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_WasNun		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_WasNun_Condition;
	information	 = 	DIA_Addon_Elvrich_WasNun_Info;
	permanent	 = 	FALSE;

	description	 = 	"Du solltest machen, daß du wieder in die Stadt kommst!";
};

func int DIA_Addon_Elvrich_WasNun_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhereIsLucia))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WasNun_Info ()
{
	AI_Output (other, self, "DIA_Addon_Elvrich_WasNun_15_00"); //Du solltest machen, dass du wieder in die Stadt kommst!
	AI_Output (self, other, "DIA_Addon_Elvrich_WasNun_04_01"); //Was denkst du, was ich mache? Ich geh direkt zurück zu meinem Meister Thorben.
	AI_Output (self, other, "DIA_Addon_Elvrich_WasNun_04_02"); //Wirst du nach den Banditen suchen?
	AI_Output (other, self, "DIA_Addon_Elvrich_WasNun_15_03"); //Tja, ich denke schon ...
	AI_Output (self, other, "DIA_Addon_Elvrich_WasNun_04_04"); //Wenn du Lucia finden solltest, bring sie sicher in die Stadt, ja?
	AI_Output (other, self, "DIA_Addon_Elvrich_WasNun_15_05"); //Ich werde sehen, was ich tun kann.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Elvrich ist zum Tischlermeister Thorben zurück gegangen."); 

	Elvrich_GoesBack2Thorben = TRUE;
	Npc_ExchangeRoutine	(self,"BACKINTHECITY");
	EquipItem	(self, ItMw_1h_Bau_Mace);
};

///////////////////////////////////////////////////////////////////////
// PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_PERM		(C_INFO)
{
	npc		 	= VLK_4302_Addon_Elvrich;
	nr		 	= 5;
	condition	= DIA_Addon_Elvrich_PERM_Condition;
	information	= DIA_Addon_Elvrich_PERM_Info;
	permanent	= TRUE;
	important 	= TRUE;
};
func int DIA_Addon_Elvrich_PERM_Condition ()
{
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	&& (MIS_LuciasLetter != LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Elvrich_PERM_Info ()
{
	AI_Output (self, other, "DIA_Addon_Elvrich_PERM_04_00"); //Danke, dass du mich gerettet hast!
};


