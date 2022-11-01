///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pyrokar_EXIT   (C_INFO)
{
	npc         = KDF_500_Pyrokar;
	nr          = 999;
	condition   = DIA_Pyrokar_EXIT_Condition;
	information = DIA_Pyrokar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pyrokar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WELCOME		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  2;
	condition	 = 	DIA_Pyrokar_WELCOME_Condition;
	information	 = 	DIA_Pyrokar_WELCOME_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_WELCOME_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_00"); //Итак, у нас новый послушник. Я полагаю, ты уже получил задание у мастера Парлана.
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_01"); //(слегка укоризненно) Ты же знаешь, что все в Братстве Огня должны выполнять свои обязанности согласно воле Инноса.
};
///////////////////////////////////////////////////////////////////////
//	Info Hagen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Hagen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Hagen_Condition;
	information	 = 	DIA_Pyrokar_Hagen_Info;
	permanent	 =  FALSE;
	description	 =  "Я должен поговорить с паладинами. Это срочно.";
};
func int DIA_Pyrokar_Hagen_Condition ()
{	
	if (other.guild  == GIL_NOV) //muss kommen
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_00"); //Я должен поговорить с паладинами. Это срочно.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_01"); //Ты кажешь нам, о чем ты собираешься говорить с ними?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_02"); //У меня для них важное сообщение.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_03"); //Что это за сообщение?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_04"); //Армия зла собирается в Долине Рудников. Ее возглавляют драконы! Мы должны остановить их, пока это еще возможно.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_05"); //Хм. Мы должны обдумать твои слова, послушник. Когда придет время, мы дадим тебе знать, что по этому поводу решил Совет.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_06"); //А пока, тебе лучше уделить самое пристальное внимание своим обязанностям послушника.
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Auge)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_07"); //Мы больше не будем отрывать тебя от работы - ты можешь идти.
		AI_StopProcessInfos (self);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Auge		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Auge_Condition;
	information	 = 	DIA_Pyrokar_Auge_Info;
	permanent	 =  FALSE;
	description	 =  "Я ищу Глаз Инноса.";
};
func int DIA_Pyrokar_Auge_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == FALSE)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Auge_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_00"); //Я ищу Глаз Инноса.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_01"); //Любой, кто полагает, что он может не только найти этот священный амулет, но также и носить его - идиот.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_02"); //Этот амулет сам выбирает своего хозяина - только тот, кто судьбой предназначен для этого, способен носить его.
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_03"); //Я все же хотел бы попробовать.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_04"); //Обязанность послушника проявлять смирение - не желания.
	
 	B_LogEntry (TOPIC_INNOSEYE, "Я не думал, что это будет так непросто, но Пирокар не отдаст Глаз добровольно, здесь не обойтись без помощи паладинов.");
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_05"); //Что ж, мы больше не будем отрывать тебя от работы - ты можешь идти.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Pyrokar_MissingPeople		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Pyrokar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Pyrokar_MissingPeople_Info;

	description	 = 	"Жители Хориниса таинственным образом исчезают.";
};
func int DIA_Addon_Pyrokar_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (Sklaven_Flucht == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Pyrokar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_00"); //Жители Хориниса таинственным образом исчезают.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_01"); //Мне это известно, и я глубоко опечален этими исчезновениями. Но этим делом занимаются маги воды.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_02"); //Они же пытаются выяснить причины странных землетрясений, происходящих в северо-восточной части Хориниса.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_03"); //До сих пор они не давали мне понять, что им требуется наша помощь. Поэтому мы не предпринимаем никаких действий.
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_04"); //Да, но...
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_05"); //Никаких 'но'! Мы будем поступать так, как считаем нужным, и я надеюсь, что ты это поймешь.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Маги Огня огорчены исчезновениями горожан. Однако, они говорят, что это этим должны заниматься Маги Воды. В монастыре мне не удастся найти помощи по этому вопросу."); 

	if (other.guild  == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	{
		AI_StopProcessInfos (self); 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GOAWAY
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GOAWAY		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_GOAWAY_Condition;
	information	 = 	DIA_Pyrokar_GOAWAY_Info;
	permanent	 = 	TRUE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_GOAWAY_Condition ()
{
	//ADDON>
	if (Npc_KnowsInfo (hero, DIA_Addon_Pyrokar_MissingPeople) == FALSE)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return FALSE;
		};
	//ADDON<

	if (Npc_IsInState (self, ZS_Talk)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Hagen)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Auge)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_GOAWAY_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_GOAWAY_11_00"); //(раздраженно) Смирение - благодетель, которой тебе еще предстоит научиться. Так или иначе.
	
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info FIRE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FIRE		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 =  1;
	condition	 = 	DIA_Pyrokar_FIRE_Condition;
	information	 = 	DIA_Pyrokar_FIRE_Info;
	permanent	 =  FALSE;
	description	 = 	"Я хочу пройти Испытание Огнем.";
};
func int DIA_Pyrokar_FIRE_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == TRUE)
	&& (other.guild  == GIL_NOV)
	&&  Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_FIRE_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_00"); //Я хочу пройти Испытание Огнем.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_01"); //(удивленно) Так ты знаешь о... ты хочешь пройти Испытание Огнем?
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_02"); //Да, я ссылаюсь на Закон Огня, который гласит...
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_03"); //(резко прерывает) Мы знаем Закон Огня. Мы также видели, как множество послушников погибли при прохождении этого испытания. Ты должен пересмотреть свое решение.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_04"); //Я хочу пройти это испытание - и я пройду его.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_05"); //(предупреждающе) Если ты категорически настаиваешь, Высший Совет подвергнет тебя этому испытанию.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_06"); //Я настаиваю на прохождении Испытания Огнем.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_07"); //В таком случае - так тому и быть. Когда ты будешь готов, каждый из магов Высшего Совета даст тебе задание, которое ты должен будешь выполнить.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_08"); //Да сжалится Иннос над твоей душой.
	
	B_LogEntry (TOPIC_FireContest,"Я потребовал у Пирокара пройти испытание огнем. Теперь я должен выполнить три задания Высшего совета.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEST		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_TEST_Condition;
	information	 = 	DIA_Pyrokar_TEST_Info;
	permanent	 =  FALSE;
	description	 = 	"Я готов пройти твое испытание, мастер.";
};
func int DIA_Pyrokar_TEST_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	&& (MIS_SCHNITZELJAGD == FALSE)
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEST_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_00"); //Я готов пройти испытание, Мастер.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_01"); //И только одному Инносу ведомо, пройдешь ли ты его. Ты будешь подвергнут тому же испытанию, что и избранные послушники.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_02"); //Испытанию Магией. (надменно) Ты, вероятно, знаешь, что только ОДИН из послушников сможет пройти это испытание.
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_03"); //Понимаю. А кто мои соперники?
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_04"); //Иннос в своей мудрости выбрал троих послушников, которые должны подвергнуться этому испытанию: Агон, Игарац и Ульф. Они уже приступили к поискам.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_05"); //(лаконично) Но хватит об этом! Услышь слова этого испытания: 'Следуй знакам Инноса и принеси то, что верующий находит в конце пути'.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_06"); //Тебе понадобится этот ключ.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_07"); //Это все, что мы можем сказать тебе.
	
	Log_CreateTopic (TOPIC_Schnitzeljagd,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Schnitzeljagd,LOG_RUNNING);
	B_LogEntry (TOPIC_Schnitzeljagd,"Пирокар дает мне Испытание Магией. Это то же самое испытание, что должны пройти избранные послушники Ульф, Игарац и Агон.");
	
	B_LogEntry (TOPIC_Schnitzeljagd,"Я должен следовать знакам Инноса и 'принести то, что верующий находит в конце пути'. Также он дал мне ключ.");
	
	CreateInvItems (self,ItKe_MagicChest,1);
	B_GiveInvItems (self,other,ItKe_MagicChest,1);
	
	//------------Igaraz klar machen------------------- 
	B_StartOtherRoutine (Igaraz,"CONTEST");
	AI_Teleport (Igaraz,"NW_TAVERNE_BIGFARM_05");	
	CreateInvItems (Igaraz, ItKe_MagicChest,1);
	Igaraz.aivar [AIV_DropDeadAndKill] = TRUE;
	Igaraz.aivar [AIV_NewsOverride] = TRUE;
	
	//---------Smalltalk Partner herbeirufen 
	B_StartOtherRoutine (NOV607,"EXCHANGE");
	
	//------------Agon klar machen-------------------
	B_StartOtherRoutine (Agon,"GOLEMDEAD");
	AI_Teleport (Agon,"NW_MAGECAVE_RUNE");
	CreateInvItems (Agon, ItKe_MagicChest,1);		
	Agon.aivar [AIV_DropDeadAndKill] = TRUE;
	Agon.aivar [AIV_NewsOverride] = TRUE;
	//------------Ulf klar machen-------------------
	B_StartOtherRoutine (Ulf,"SUCHE");
	AI_Teleport (Ulf,"NW_TROLLAREA_PATH_42");	
	CreateInvItems (Ulf, ItKe_MagicChest,1);	
	Ulf.aivar [AIV_DropDeadAndKill] = TRUE;
	Ulf.aivar [AIV_NewsOverride] = TRUE;
	//-------------------------------
	MIS_SCHNITZELJAGD = LOG_RUNNING;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info RUNNING
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_RUNNING		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	20;
	condition	 = 	DIA_Pyrokar_RUNNING_Condition;
	information	 = 	DIA_Pyrokar_RUNNING_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Pyrokar_RUNNING_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&&  Npc_IsInState (self, ZS_Talk) 
	&& (other.guild  == GIL_NOV)
	&& (Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_RUNNING_Info ()
{
	var int randomizer;
	randomizer = Hlp_Random (3); 
	
	if  (randomizer == 0)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_00"); //Пока ты не пройдешь это испытание, нам нечего сказать тебе.
	}
	else if (randomizer == 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_01"); //Чего ты ждешь? Иди, проходи испытание!
	}
	else if (randomizer == 2)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_02"); //Пришло время подтвердить твои громкие слова делами. Тебе так не кажется, послушник?
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SUCCESS_Condition;
	information	 = 	DIA_Pyrokar_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"Я нашел рунный камень.";
};
func int DIA_Pyrokar_SUCCESS_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (hero.guild  == GIL_NOV)
	&& (!Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	&& (( Npc_HasItems (other,itmi_runeblank) >= 1)
	|| ( Npc_HasItems (other,itru_firebolt) >= 1))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SUCCESS_Info ()
{
	
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_00"); //Я нашел рунный камень.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_01"); //(недоверчиво) Ты... сделал это?! Ты следовал знакам и нашел скрытый портал...
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_02"); //... и одной левой победил всех тех монстров, что уже считали меня своей добычей.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_03"); //А другие послушники? Что насчет Агона? Они не опередили тебя?
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_04"); //Они не смогли. Я думаю, им было не суждено пройти это испытание.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_05"); //Что ж, в таком случае, мы объявляем, что ты прошел это испытание. А этот рунный камень теперь твой.
	 
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	B_GivePlayerXP (XP_SCHNITZELJAGD);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM wenn Prьfung erfolgreich und die anderen noch nicht. 
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Todo		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Todo_Condition;
	information	 = 	DIA_Pyrokar_Todo_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Pyrokar_Todo_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (other.guild  == GIL_NOV)
	&& ((MIS_RUNE  != LOG_SUCCESS)
	|| (MIS_GOLEM != LOG_SUCCESS)) 

	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Todo_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_00"); //Ты прошел испытание, которому подверг тебя я.
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_01"); //Но...
	
	if (MIS_RUNE  != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_02"); //... тебе еще необходимо пройти испытание Ультара.
	};
	if (MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_03"); //... тебе еще необходимо выполнить задание Серпентеса.
	};
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MAGICAN		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	3;
	condition	 = 	DIA_Pyrokar_MAGICAN_Condition;
	information	 = 	DIA_Pyrokar_MAGICAN_Info;
	permanent	 =  FALSE;
	description	 = 	"Теперь я буду принят в Гильдию Магов?";
};

func int DIA_Pyrokar_MAGICAN_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (MIS_RUNE  		  == LOG_SUCCESS)
	&& (MIS_GOLEM 		  == LOG_SUCCESS)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_MAGICAN_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_MAGICAN_15_00"); //Теперь я буду принят в Гильдию Магов?
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_01"); //Ты сделал это. Ты прошел Испытание Огнем. Мы с самого начала были уверены, что ты преуспеешь в этом.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_02"); //(настойчиво) Мы также уверены, что ты продолжишь прилагать все усилия, чтобы стать ДОСТОЙНЫМ слугой Инноса.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_03"); //Итак, если ты готов принять Клятву Огня, ты будешь принят в наши ряды.
	
};
///////////////////////////////////////////////////////////////////////
//	Info OATH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_OATH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	1;
	condition	 = 	DIA_Pyrokar_OATH_Condition;
	information	 = 	DIA_Pyrokar_OATH_Info;
	permanent 	 =  FALSE;
	description	 = 	"Я готов вступить в Круг Огня.";
};
func int DIA_Pyrokar_OATH_Condition ()
{	
	if (Npc_KnowsInfo (hero, DIA_Pyrokar_MAGICAN))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_OATH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_00"); //Я готов вступить в Круг Огня.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_01"); //Хорошо, тогда принеси Клятву Огня.
	


	AI_Output (self, other, "DIA_Pyrokar_OATH_11_02"); //(торжественно) Клянешься ли ты, перед лицом Инноса Всемогущего, его слуг и Священного Огня...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_03"); //... что с этого момента и до конца дней вся жизнь твоя будет едина с огнем...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_04"); //... до тех пор пока твое тело и душа не найдут покой в этих священных чертогах и пламя твоей жизни не угаснет?
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_05"); //Клянусь.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_06"); //Произнеся слова этой клятвы, ты присоединился к Соглашению Огня.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_07"); //Носи эту робу в знак этих вечных уз.
	
	CreateInvItems 		(hero,ITAR_KDF_L,1);
	AI_EquipArmor		(hero,ITAR_KDF_L);		
	
	other.guild = GIL_KDF;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Npc_SetTrueGuild (other, GIL_KDF);
	
	Fire_Contest = TRUE;//fьrs Log
	
	Snd_Play ("LEVELUP"); 
	
	KDF_Aufnahme = LOG_SUCCESS;
	SLD_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	B_GivePlayerXP (XP_BecomeMage);
	
	
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_08"); //Теперь, когда ты был принят в наши ряды, ты можешь поговорить с лордом Хагеном, главнокомандующим паладинов.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_09"); //Нам также очень интересно знать, как он оценивает ситуацию. Так что ты теперь можешь отправляться в Хоринис.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_10"); //Мы ожидаем, что ты принесешь его ответ немедленно.
};
///////////////////////////////////////////////////////////////////////
//	Info  Lernen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Lernen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Lernen_Condition;
	information	 = 	DIA_Pyrokar_Lernen_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"Что я могу изучить теперь?";
};
func int DIA_Pyrokar_Lernen_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Lernen_Info ()
{
	AI_Output	(other, self, "DIA_Pyrokar_Lernen_15_00"); //Что я могу изучить теперь?
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_01"); //Прежде всего, теперь ты имеешь право изучать Круги Магии. Они дадут тебе власть над рунами.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_02"); //Чем выше ты будешь подниматься в шести Кругах Магии, тем более сильными заклинаниями ты сможешь овладеть.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_03"); //Ты сможешь узнать формулы заклинаний у наших братьев в монастыре. Каждый из них специализируется в определенной области.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_04"); //Каррас, например, мастер вызова, а Хиглас обучит тебя магии огня.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_05"); //Никто не знает больше о силах льда, чем Мардук. Парлан может обучить тебя другим различным заклинаниям - и он введет тебя в первые круги.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_06"); //Но каждый из них будет учить тебя только формулам - руны ты должен будешь создавать сам.
	
	Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
	
	B_LogEntry (Topic_KlosterTeacher,"Мастер Парлан посвятит меня в первые круги магии.");
	
	B_LogEntry (Topic_KlosterTeacher,"Брат Каррас обучает формулам вызова.");
	B_LogEntry (Topic_KlosterTeacher,"Брат Хиглас может посвятить меня в тайны огня.");
	B_LogEntry (Topic_KlosterTeacher,"Брат Мардук может посвятить меня в тайны льда и грома.");
	B_LogEntry (Topic_KlosterTeacher,"Брат Парлан обучает множеству различных формул.");
};

///////////////////////////////////////////////////////////////////////
//	Info Wunsch
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Wunsch		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Wunsch_Condition;
	information	 = 	DIA_Pyrokar_Wunsch_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"Я хотел бы высказать пожелание...";
};
func int DIA_Pyrokar_Wunsch_Condition ()
{	
	if (other.guild == GIL_KDF)
	&& (Kapitel < 2)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Wunsch_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Wunsch_15_00"); //Я хотел бы высказать пожелание...
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_01"); //После принятия в наши ряды, каждый маг обладает правом на первый шаг.
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_02"); //Итак, каким же будет твой первый шаг в качестве мага?
	
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	Info_AddChoice (DIA_Pyrokar_Wunsch,"Никаким.",DIA_Pyrokar_Wunsch_Nothing);
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Позволь послушнику Бабо возглавить монастырский сад.",DIA_Pyrokar_Wunsch_Babo);
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Позволь послушнику Ополосу получить доступ в библиотеку.",DIA_Pyrokar_Wunsch_Opolos);
	};
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Позволь послушнику Дуриану остаться в монастыре.",DIA_Pyrokar_Wunsch_Dyrian);
	};
};

FUNC VOID DIA_Pyrokar_Wunsch_Nothing ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Nothing_15_00"); //Никаким.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Nothing_11_01"); //(изумленно) Да будет так. Новый маг отказывается от первого шага.
	
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	
	
};

FUNC VOID DIA_Pyrokar_Wunsch_Dyrian ()
{
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Dyrian_15_00"); //Позволь послушнику Дуриану остаться в монастыре.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01"); //Да будет так.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02"); //Этому послушнику будет позволено остаться в монастыре, и он займет место садовника, которое сейчас вакантно.
	
	B_GivePlayerXP (XP_HelpDyrian);
	
	B_StartOtherRoutine (Dyrian,"FAVOUR");
	
	MIS_HelpDyrian = LOG_SUCCESS;
	
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos = LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Babo ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Babo_15_00"); //Позволь послушнику Бабо возглавить монастырский сад.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_01"); //Да будет так.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_02"); //С сего момента, послушник Бабо будет отвечать за монастырский сад.
	
	B_GivePlayerXP (XP_HelpBabo);
	
	B_StartOtherRoutine (Babo,"FAVOUR");
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	MIS_HelpBabo = LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Opolos ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Opolos_15_00"); //Позволь послушнику Ополосу получить доступ в библиотеку.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_01"); //Да будет так.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_02"); //С сего момента послушнику Ополосу будет позволено изучать писания Инноса.
	
	B_GivePlayerXP (XP_HelpOpolos);
	
	B_StartOtherRoutine (Opolos,"FAVOUR");
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	
	MIS_HelpOpolos 	= LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};
///////////////////////////////////////////////////////////////////////
//	Info war bei LH und nicht in der OW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Nachricht		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Nachricht_Condition;
	information	 = 	DIA_Pyrokar_Nachricht_Info;
	permanent	 =  FALSE;
	description	 = 	"Я принес новости от лорда Хагена ...";
};
func int DIA_Pyrokar_Nachricht_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Nachricht_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_00"); //Я принес новости от лорда Хагена. Он хочет получить доказательства присутствия драконов и армии Зла.
	
	if (EnterOW_Kapitel2 == FALSE)
	{
		AI_Teleport (Sergio,"NW_MONASTERY_PLACE_09");
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_01"); //Поэтому я должен отправиться в Долину Рудников и доставить ему эти доказательства.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_02"); //Хорошо. Ты выполнишь этот приказ. Паладин Сержио сопроводит тебя к Проходу.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_03"); //Да хранит тебя Иннос.
		
		Sergio_Follow = TRUE;
		AI_StopProcessInfos (self);
		B_StartOtherRoutine (Sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_04"); //Я отправляюсь в Долину Рудников.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_05"); //Хорошо. Так как ты уже знаешь путь в долину, тебе не нужен эскорт.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_06"); //Выполни это задание лорда Хагена - да хранит тебя Иннос.
	};

};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	4;
	condition	 = 	DIA_Pyrokar_TEACH_Condition;
	information	 = 	DIA_Pyrokar_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Обучи меня последнему Кругу Магии.";
};
func int DIA_Pyrokar_TEACH_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	&& (Kapitel >= 5) 
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEACH_15_00"); //Обучи меня последнему Кругу Магии.
	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		if B_TeachMagicCircle (self,other, 6)  
		{
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_01"); //Много времени прошло с тех пор, как ты связал себя с огнем. Многое произошло с тех пор, но покоя все нет.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_02"); //Ты Избранный Инноса. И тебе понадобятся все твои силы, чтобы победить в этой битве.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_03"); //Я посвящаю тебя, о, Избранный. Ты входишь в шестой Круг - да принесешь ты с собой свет и рассеешь тьму.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_04"); //Теперь ты можешь узнать формулы этого последнего круга от меня, если ты того желаешь.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_05"); //Ох - и еще одно. Мне понадобилось некоторое время, чтобы признать тебя.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_06"); //Ты получил это письмо от меня, когда они швырнули тебя за Барьер.
			AI_Output (other, self, "DIA_Pyrokar_TEACH_15_07"); //Да, ты таким образом избавил меня от пустой болтовни судьи.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_08"); //И ты Избранный Инноса.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_09"); //Получи же теперь мое благословение, о Избранный!
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_10"); //Иннос, свет солнца и огонь дерева, благослови этого человека, твоего избранного слугу.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_11"); //Дай ему мужество, силу и мудрость следовать по пути, который ты предначертал ему.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_11_12"); //Время для этого еще не пришло. Когда ты пройдешь чуть дальше по пути, который Иннос покажет тебе, я обучу тебя.
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info SPELLS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPELLS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SPELLS_Condition;
	information	 = 	DIA_Pyrokar_SPELLS_Info;
	permanent	 = 	TRUE;
	description	 = 	"Обучи меня (созданию рун)";
};
func int DIA_Pyrokar_SPELLS_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 6)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SPELLS_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "DIA_Pyrokar_SPELLS_15_00"); //Обучи меня.
	
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
	Info_AddChoice		(DIA_Pyrokar_SPELLS, DIALOG_BACK, DIA_Pyrokar_SPELLS_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,DIA_Pyrokar_SPELLS_Firerain);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_BreathOfDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_BreathOfDeath)) ,DIA_Pyrokar_SPELLS_BreathOfDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_MassDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_MassDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MassDeath)) ,DIA_Pyrokar_SPELLS_MassDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Shrink, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Shrink)) ,DIA_Pyrokar_SPELLS_Shrink);
		abletolearn = (abletolearn +1);
	};
	if (abletolearn < 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_SPELLS_11_01"); //Мне больше нечему учить тебя.
	};
};
FUNC VOID DIA_Pyrokar_SPELLS_BACK()
{
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
};
FUNC VOID DIA_Pyrokar_SPELLS_Firerain()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);	
};
FUNC VOID DIA_Pyrokar_SPELLS_BreathOfDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_BreathOfDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_MassDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MassDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_Shrink()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Shrink);	
};
///////////////////////////////////////////////////////////////////////
//	Info Parlan
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Parlan		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_Parlan_Condition;
	information	 = 	DIA_Pyrokar_Parlan_Info;
	permanent	 = 	FALSE;
	description	 = 	"Меня прислал Парлан ...";
};
func int DIA_Pyrokar_Parlan_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& (Parlan_Sends == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Parlan_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_Parlan_15_00"); //Меня прислал Парлан. Я хочу повысить мои магические способности.
		AI_Output (self, other, "DIA_Pyrokar_Parlan_11_01"); //Что ж, ты многое узнал, и твоя сила выросла. С этого момента, ты будешь учиться у меня.
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH_MANA		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_TEACH_MANA_Condition;
	information	 = 	DIA_Pyrokar_TEACH_MANA_Info;
	permanent	 = 	TRUE;
	description	 = 	"Я хочу повысить мои магические способности.";
};
func int DIA_Pyrokar_TEACH_MANA_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& Npc_KnowsInfo (hero,DIA_Pyrokar_Parlan)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_MANA_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_TEACH_MANA_15_00"); //Я хочу повысить мои магические способности.
		
		Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
		Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= 250)  
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_MANA_11_00"); //Я чувствую, как магическая энергия течет через тебя, не зная преград. Даже я не могу показать тебе, как повысить ее еще больше.
	};
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PERM		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	900;
	condition	 = 	DIA_Pyrokar_PERM_Condition;
	information	 = 	DIA_Pyrokar_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"(благословение)";
};
func int DIA_Pyrokar_PERM_Condition ()
{	
	if (Kapitel >= 2)	
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_PERM_Info ()
{
	if (hero.guild == GIL_KDF)
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_00"); //Благослови меня, мастер.
			}
		else
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_01"); //Как насчет благословения? Мне оно не помешало бы.
			};
		
	if (Kapitel == 5)	
	&& 	(MIS_PyrokarClearDemonTower == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_02"); //Да увенчается успехом твоя последняя битва против нашего заклятого врага. Да пребудет с тобой Иннос.
			}
		else
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_03"); //Да встанет Иннос между тобой и болью на всех нечестивых путях, по которым тебе суждено пройти.
			};
};

//##############################################################
//##
//##
//##							KAPITEL 3
//##
//##
//##############################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Pyrokar_KAP3_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP3_EXIT_Condition;
	information	= DIA_Pyrokar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BACKFROMOW		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BACKFROMOW_Condition;
	information	 = 	DIA_Pyrokar_BACKFROMOW_Info;

	description	 = 	"Я пришел из старой Долины Рудников.";
};

func int DIA_Pyrokar_BACKFROMOW_Condition ()
{
	if (Kapitel >= 3)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BACKFROMOW_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_00"); //Я пришел из старой Долины Рудников.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_01"); //Что ты можешь доложить?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_02"); //Враг сформировал там армию из орков и драконов.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_03"); //Мы уже узнали это от Милтена - но что насчет королевского груза руды?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_04"); //Шахты, в которых идет добыча в долине, не могут удовлетворить потребности короля.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_05"); //Дни становятся темнее, а свет солнца все тусклее.
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_06"); //На меня напали люди в черных рясах.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_07"); //Я знаю. Это Ищущие. Приспешники Белиара из преисподней. Остерегайся их. Они попытаются овладеть тобой.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_08"); //Будучи одержимым, ты больше не будешь самим собой. Только здесь, в монастыре сможешь ты найти помощь. Так что будь осторожен.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Пирокар рассказал мне об Ищущих, людях в черных рясах. Это приспешники Белиара. Он предупредил меня, что они могут сделать меня одержимым. Если это произойдет, я должен немедленно возвращаться в монастырь."); 
	};

	if ((Npc_IsDead(Karras))==FALSE)
	&& (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_09"); //Я попросил Карраса заняться этим вопросом. Ему наверняка скоро удастся лучше понять эту проблему, что позволит нам видеть яснее.
		PyrokarToldKarrasToResearchDMT = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Пирокар приказал Каррасу ликвидировать угрозу, исходящую от Ищущих."); 
	};

	AI_Output (self ,other, "DIA_Pyrokar_Add_11_00"); //Вот - эта руна всегда перенесет тебя прямо в монастырь, если тебе понадобится помощь.
	B_GiveInvItems (self, other, itru_teleportmonastery, 1);
	
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_10"); //Помни, мы должны сопротивляться, иначе нам всем настанет конец.

};

///////////////////////////////////////////////////////////////////////
//	Info GiveInnoseye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GIVEINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	31;
	condition	 = 	DIA_Pyrokar_GIVEINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_GIVEINNOSEYE_Info;

	description	 = 	"Я пришел, чтобы забрать Глаз Инноса.";
};

func int DIA_Pyrokar_GIVEINNOSEYE_Condition ()
{
	if (Kapitel == 3)	
		&& (Npc_HasItems (other,ItWr_PermissionToWearInnosEye_MIS))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_15_00"); //Я пришел, чтобы забрать Глаз Инноса.
	B_GiveInvItems 		(other, self, ItWr_PermissionToWearInnosEye_MIS,1);
	//Joly: hier kein  B_UseFakeScroll();    Pyrokar poppt aus seinem Thron!!!
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_01"); //Я вижу, ты получил позволение лично от лорда Хагена носить Глаз Инноса.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_02"); //Но боюсь, мне придется разочаровать тебя. Мы стали жертвами вероломного плана врага.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_03"); //Глаз Инноса был нагло украден из этих священных стен.

	
	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "Кто мог совершить столь дерзкий поступок, мастер?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	}
	else
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "Кто сделал это?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	};
};
func void DIA_Pyrokar_GIVEINNOSEYE_wer ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_00"); //Кто мог совершить столь дерзкий поступок, мастер?
	}
	else
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_01"); //Кто сделал это?
	};

	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_02"); //Зло коварно, и обычно действует тайно. Крайне редко можно видеть, как оно выползает на свет божий, чтобы открыто проводить в жизнь свои махинации.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_03"); //Но в эти дни все стало по-другому. Враг теперь действует в открытую на каждой улице, в каждом доме и на каждой площади.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_04"); //Это может означать только, что он больше не боится своего противника, и не собирается отступать ни перед чем.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_05"); //Один из наших самых верных последователей, кандидат на священную робу Мага Огня, неожиданно изменил свою веру и сделал это в вызывающе дьявольской манере. Это Педро.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_06"); //Враг овладел им, нанеся тем самым ужасное поражение всем нам.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_07"); //Педро пробил себе дорогу мечом в наши самые священные покои и украл Глаз.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_08"); //Я боюсь, что он просто слишком много времени проводил наедине, за воротами и защитными стенами монастыря, открытый для опасностей всякого рода.

	Pedro.flags = 0;	//Joly: Pedro ist nun mortal und zum AbschuЯ freigegeben.
	Pedro_Traitor = TRUE;	//Joly: Pedro ist fьr den SC nun als Traitor bekannt. MuЯ hier stehen bleiben und darf nur einmal auf True gesetzt werden

 	B_LogEntry (TOPIC_INNOSEYE, "Невероятно. Хотя я ожидал чего-то подобного. Я опоздал, эти тупицы из монастыря позволили какому-то послушнику украсть Глаз, и теперь мне придется гнаться за предателем Педро и надеяться, что он еще не продал Глаз кому-нибудь.");
 	B_LogEntry (TOPIC_TraitorPedro, "Предатель Педро украл Глаз Инноса из монастыря. Как я понимаю, маги огня теперь из кожи вон лезут, чтобы найти этого предателя.");
};



///////////////////////////////////////////////////////////////////////
//	Info NOVIZENCHASE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_NOVIZENCHASE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	34;
	
	condition	 = 	DIA_Pyrokar_NOVIZENCHASE_Condition;
	information	 = 	DIA_Pyrokar_NOVIZENCHASE_Info;

	description	 = 	"Куда побежал этот вор?";
};

func int DIA_Pyrokar_NOVIZENCHASE_Condition ()
{
	if (Kapitel == 3)
	   && (Pedro_Traitor == TRUE)	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_NOVIZENCHASE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_NOVIZENCHASE_15_00"); //Куда побежал этот вор?
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_01"); //Педро убил несколько послушников, пытавшихся остановить его, и растворился в утреннем тумане.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_02"); //Многие послушники бросились за ним в погоню, чтобы вернуть Глаз назад, на его законное место.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_03"); //Если ты хочешь догнать их, то поторопись, пока Педро не стал недосягаемым.

	MIS_NovizenChase = LOG_RUNNING;	
};

///////////////////////////////////////////////////////////////////////
//	Info FoundInnosEye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FOUNDINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	35;
	condition	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Info;

	description	 = 	"Я нашел Глаз Инноса.";
};

func int DIA_Pyrokar_FOUNDINNOSEYE_Condition ()
{
	if (Kapitel == 3)
		&& 	(MIS_NovizenChase == LOG_RUNNING)
		&& ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE))	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_FOUNDINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_00"); //Я нашел Глаз Инноса. Он поврежден.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_01"); //Но... этого не может быть. Что произошло?
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_02"); //Его заполучили в свои руки заказчики весьма отвратительного вида. Так получилось, что я прибыл слишком поздно.
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_03"); //Они выполняли странный обряд на пьедестале в форме полумесяца в здешнем лесу.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_04"); //Да пребудет с нами Иннос! Они осквернили наш Круг Солнца.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_05"); //Даже в своих худших кошмарах не мог я представить, что они обладают такой силой.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	MIS_NovizenChase = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice		(DIA_Pyrokar_FOUNDINNOSEYE, "Что мы теперь можем сделать?", DIA_Pyrokar_FOUNDINNOSEYE_was );
	
};
func void DIA_Pyrokar_FOUNDINNOSEYE_was ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_15_00"); //Что мы теперь можем сделать?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_01"); //Враг стал очень силен. Но все же, этот древний артефакт представлял серьезную угрозу для него.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_02"); //Мы должны исцелить Глаз и восстановить его былую силу. Но время работает против нас.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_03"); //Я даже представить себе не могу, что теперь ждет всех нас. Без защиты Глаза, мы беспомощны и находимся полностью в руках врага.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_04"); //Иди в город, к Ватрасу, магу Воды. В этой ужасной ситуации, только он знает, что нужно делать. Отнеси Глаз ему, и поторопись.


	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, DIALOG_BACK, DIA_Pyrokar_FOUNDINNOSEYE_weiter );
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Почему Ватрас?", DIA_Pyrokar_FOUNDINNOSEYE_was_vatras );
	};
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Что такое Круг Солнца?", DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis );
	
	
	B_LogEntry (TOPIC_INNOSEYE, "Пирокар хочет, чтобы я спросил у мага воды Ватраса, находящегося в городе,  совета о том, что можно сделать с поврежденным Глазом.");

	MIS_Pyrokar_GoToVatrasInnoseye = LOG_RUNNING;

};
func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00"); //Почему Ватрас?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01"); //Привилегия ношения робы мага не дает тебе права обсуждать мои приказы, брат.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02"); //Ватрас слуга Аданоса. Только знания Магов Воды могут принести нам прояснение в этот мрачный час.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03"); //Это все, что тебе нужно знать.

};


func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00"); //Что такое Круг Солнца?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01"); //Каждый год все маги и послушники монастыря отправляются к этому месту во время солнцестояния, чтобы отметить начало нового цикла.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02"); //Это место наполняется безмерной силой солнца.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03"); //У меня никогда даже мысль такая не появлялась, что эту силу можно обратить. И все же это произошло.
};

func void DIA_Pyrokar_FOUNDINNOSEYE_weiter ()
{
		Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
};


///////////////////////////////////////////////////////////////////////
//	Info spokeToVatras
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPOKETOVATRAS		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_SPOKETOVATRAS_Condition;
	information	 = 	DIA_Pyrokar_SPOKETOVATRAS_Info;

	description	 = 	"Я говорил с Ватрасом.";
};

func int DIA_Pyrokar_SPOKETOVATRAS_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		{
			return TRUE;
		};
};

func void DIA_Pyrokar_SPOKETOVATRAS_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_00"); //Я говорил с Ватрасом.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_01"); //Ах, хорошо. Где он?
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_02"); //Он готовит ритуал в Круге Солнца, чтобы исцелить Глаз Инноса.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_03"); //Если это правда, то, может быть, у нас все же сеть надежда.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_04"); //Ватрас хочет, чтобы Ксардас и ты помогли ему в этом.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_05"); //ЧТО? Ксардас тоже будет там? Ты ведь это не серьезно.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_06"); //Послушай. Это не мое решение. Ватрас настаивает.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_07"); //Всегда и всюду этот Ксардас. Я устал от этого. Ничего не может быть хуже.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_08"); //Откуда мне знать, что этот Ксардас не в союзе с нашим врагом?
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_09"); //Я не могу доверять Ксардасу. И не важно, что мы так нуждаемся в нем.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_10"); //Извини, но я не могу помочь Ватрасу при таких условиях.
	B_GivePlayerXP (XP_Ambient);


};


///////////////////////////////////////////////////////////////////////
//	Info XardasVertrauen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_XARDASVERTRAUEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Condition;
	information	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Info;

	description	 = 	"Без тебя ничего не получится ...";
};

func int DIA_Pyrokar_XARDASVERTRAUEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SPOKETOVATRAS))
		&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_XARDASVERTRAUEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_00"); //Без тебя ничего не получится. Ватрас не сможет провести этот ритуал.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_01"); //Ты должен довериться Ксардасу.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_02"); //Я ничего не могу поделать, ты слышишь? У меня нет ни малейшего доказательства, что Ксардас не работает против нас. Я не могу сделать это.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_03"); //А что если я принесу тебе доказательство?
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_04"); //Боюсь, это невозможно. Это должно быть  что-то, что действительно потрясет меня.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_05"); //Что касается Ксардаса, то у меня большие сомнения насчет того, что он вообще может произвести на меня впечатление.

	B_LogEntry (TOPIC_INNOSEYE, "Пирокара прямо в дрожь бросает, когда он слышит о Ксардасе. Я должен обсудить с Ксардасом, как заставить Пирокара принять участие в ритуале в Круге Солнца.");
	
	Pyrokar_DeniesInnosEyeRitual = TRUE;

};

///////////////////////////////////////////////////////////////////////
//	Info Buchzurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHZURUECK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BUCHZURUECK_Condition;
	information	 = 	DIA_Pyrokar_BUCHZURUECK_Info;

	description	 = 	"Я принес эту книгу от Ксардаса.";
};

func int DIA_Pyrokar_BUCHZURUECK_Condition ()
{
	if (Npc_HasItems (other,ItWr_XardasBookForPyrokar_Mis))
		 && (Kapitel == 3)
		 {
				return TRUE;
		 };
};

func void DIA_Pyrokar_BUCHZURUECK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_00"); //Я принес эту книгу от Ксардаса.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_01"); //Это знак его доверия.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_02"); //Покажи.
	B_GiveInvItems 		(other, self, ItWr_XardasBookForPyrokar_Mis,1);
	Npc_RemoveInvItems 	(self, ItWr_XardasBookForPyrokar_Mis,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_03"); //(пораженно) Но это невероятно! Ты имеешь хоть малейшее представление о том, что ты только что дал мне?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_04"); //Ээээ. Нет.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_05"); //(сердито) Это древний, давно потерянный том из давно прошедших дней.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_06"); //Мы все думали, что он утерян навсегда, и теперь я узнаю, что Ксардас все это время знал, что сталось с ним.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_07"); //Так ты будешь присутствовать на ритуале?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_08"); //Да, я отправляюсь в Круг Солнца, но, конечно, не потому, что я убедился в добрых намерениях Ксардаса.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_09"); //На самом деле, я собираюсь заставить этого шакала объяснить, где он прятал эту книгу столько долгих лет. На этот раз он, определенно, зашел слишком далеко.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_10"); //Увидимся в Круге Солнца.
	
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"THRONE",-1);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
	B_LogEntry (TOPIC_INNOSEYE, "Пирокар, наконец, согласился отправиться к Кругу Солнца.");
	Pyrokar_GoesToRitualInnosEye = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info preRitual
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PRERITUAL		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_PRERITUAL_Condition;
	information	 = 	DIA_Pyrokar_PRERITUAL_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ты думаешь, вы сможете восстановить Глаз?";
};

func int DIA_Pyrokar_PRERITUAL_Condition ()
{
		if (Pyrokar_GoesToRitualInnosEye == TRUE)
			&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
			&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_PRERITUAL_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_PRERITUAL_15_00"); //Ты думаешь, вы сможете восстановить Глаз?
	AI_Output			(self, other, "DIA_Pyrokar_PRERITUAL_11_01"); //Трудно сказать. Поживем - увидим.
};

///////////////////////////////////////////////////////////////////////
//	Info AugeGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AUGEGEHEILT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_AUGEGEHEILT_Condition;
	information	 = 	DIA_Pyrokar_AUGEGEHEILT_Info;

	description	 = 	"Вы сделали это. Глаз Инноса исцелен.";
};

func int DIA_Pyrokar_AUGEGEHEILT_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Pyrokar_AUGEGEHEILT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_00"); //Вы сделали это. Глаз Инноса исцелен.
	AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_01"); //Я почти не верил, что это возможно.

	
	if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_02"); //Да, мастер.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_03"); //Ты уже неоднократно доказал, что готов к вступлению в Высший Орден Магов Огня.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_04"); //С этого дня ты являешься членом Совета и будешь представлять наш Орден по всему свету. Теперь ты один из высших Магов Огня.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_05"); //Носи эту священную робу с достоинством и неси в мир порядок, честь и славу, брат мой.
		
			CreateInvItem	(hero, ITAR_KDF_H);
			AI_EquipArmor	(hero, ITAR_KDF_H);	
			
			heroGIL_KDF2 = TRUE;
		};	
};

//////////////////////////////////////////////////////////////////////
//	Info Kap4_Ready
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_KAP3_READY		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_KAP3_READY_Condition;
	information	 = 	DIA_Pyrokar_KAP3_READY_Info;

	description	 = 	"Что мне остается сделать здесь?";
};

func int DIA_Pyrokar_KAP3_READY_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_AUGEGEHEILT))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_KAP3_READY_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_00"); //Что мне остается сделать здесь?
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_01"); //Не трать свое время на тривиальные вещи. Иди и уничтожь драконов. Вот, возьми Глаз.
	CreateInvItems (self,ItMi_InnosEye_MIS,1);
	B_GiveInvItems (self, other, ItMi_InnosEye_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_02"); //Помни, что тебе нужно сначала поговорить с драконом, прежде чем ты сможешь атаковать его.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_03"); //Das Auge wird dir helfen, die Drachen dazu zu zwingen, mit dir zu reden.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_04"); //Es bietet dir nicht nur Schutz gegen ihre Angriffe, es fьgt ihnen auch unertrдgliche Schmerzen zu, wenn du es bei dir trдgst.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_01"); //Сила Глаза заставит драконов говорить с тобой, и говорить правду.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_02"); //Кроме того, он дает защиту от их атак.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_05"); //Однако, его сила не вечна. Тебе придется снова пополнять его магической энергией.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_06"); //Для этого тебе понадобится эссенция из сердца дракона, которую нужно объединить с Глазом на алхимическом столе.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_07"); //Только тогда ты сможешь приблизиться к очередному дракону.
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_08"); //Спасибо. Я запомню это.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_09"); //Теперь у тебя есть все необходимое. Иди же. У тебя не так много времени.

	PLAYER_TALENT_ALCHEMY[Charge_InnosEye] 		= TRUE;	
	PrintScreen	(PRINT_LearnAlchemyInnosEye, -1, -1, FONT_Screen, 2);
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP (XP_Ambient);	
	
	CreateInvItems   (Gorax, ItMi_RuneBlank, 1);
	
	Log_CreateTopic (TOPIC_DRACHENJAGD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD, LOG_RUNNING);
	B_LogEntry (TOPIC_DRACHENJAGD,"Теперь я готов к встрече с драконами. Глаз Инноса поможет мне уничтожить их. Но прежде чем вступать в битву с драконами, я должен не забыть надеть его. Я должен поговорить с драконами, прежде чем начинать сражение. Проблема состоит в том, что Глаз теряет свою силу каждый раз, когда я разговариваю с одним из них. Чтобы восстановить силу этого амулета, мне необходимо сердце дракона и пустая мензурка. Я должен объединить ослабленный камень и экстракт из драконьего сердца на алхимическом столе, прежде чем противостоять другому дракону."); 

	MIS_ReadyforChapter4 = TRUE; //Joly: Mit dieser Varible in den Levelchange zur OW -> Kapitel 4
	B_NPC_IsAliveCheck (NEWWORLD_ZEN);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info BuchderBessenen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHDERBESSENEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	39;
	condition	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Condition;
	information	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Info;

	description	 = 	"Я нашел странный альманах.";
};

func int DIA_Pyrokar_BUCHDERBESSENEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_BACKFROMOW))
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS))		
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_BUCHDERBESSENEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_00"); //Я нашел странный альманах.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_01"); //Да? Что это за альманах?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_02"); //Я не уверен. Я думал, ты можешь знать, что делать с ним.
	B_GiveInvItems 		(other, self, ITWR_DementorObsessionBook_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_03"); //Воистину, это очень тревожный знак. Я рад, что ты принес его мне. Это было мудро.
	B_GivePlayerXP (XP_Ambient);
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_04"); //Я полагаю, что он не единственный. Иди и найди еще эти книги проклятия.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_05"); //Я подозреваю, что это инструмент Ищущих.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_06"); //Они используют его, чтобы контролировать потерянные души своих жертв.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_07"); //Они, очевидно, записывают имена тех, кем они планируют овладеть, в эти книги.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_08"); //Послушай. Я дам тебе это магическое письмо. Оно покажет тебе имена, записанные в этих книгах.
		CreateInvItems (self, ItWr_PyrokarsObsessionList, 1);									
		B_GiveInvItems (self, other, ItWr_PyrokarsObsessionList, 1);					
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_09"); //Найди этих жертв и принеси мне их книги. Я избавлюсь от них.
	
		if ((Npc_IsDead(Karras))== FALSE)
			{
				AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_10"); //Но сначала ты должен показать хотя бы одну из них Каррасу. Может, это поможет ему в его исследованиях.
			};
	
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_11"); //И не сделай ошибку, попытавшись уничтожить их самостоятельно. Ты еще не готов выдержать их силу.

		B_LogEntry (TOPIC_DEMENTOREN,"Пирокар хочет, чтобы Альманах Одержимых не принес вреда. Он дал мне список всех, кого Ищущие планируют сделать одержимыми. В этом списке Пирокара позднее могут появиться новые имена."); 
	};
	
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_12"); //Не приближайся к Ищущим, иначе они овладеют тобой.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_13"); //Если ты все же поймешь, что не в состоянии сопротивляться их зову, возвращайся ко мне как можно скорее.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_14"); //Только здесь, в монастыре, твоя душа может быть спасена.

	if ((Npc_IsDead(Karras))== FALSE)
	&& (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_15"); //А от их ментальных атак нет никакой защиты?
			AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_16"); //Защита возможна. Каррас может знать что-нибудь об этом.
			Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
			B_LogEntry (TOPIC_DEMENTOREN,"Каррас должен помочь мне найти защиту от ментальных атак Ищущих."); 
		};
};

///////////////////////////////////////////////////////////////////////
//	Info SCObsessed
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCOBSESSED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	70;
	condition	 = 	DIA_Pyrokar_SCOBSESSED_Condition;
	information	 = 	DIA_Pyrokar_SCOBSESSED_Info;
	permanent	 = 	TRUE;

	description	 = 	"(Вылечить одержимость)";
};

func int DIA_Pyrokar_SCOBSESSED_Condition ()
{
	if (SC_IsObsessed == TRUE)
		{
				return TRUE;
		};
};

var int Got_HealObsession_Day;
func void DIA_Pyrokar_SCOBSESSED_Info ()
{
	if ((Got_HealObsession_Day<=(Wld_GetDay()-2)) || (Got_HealObsession_Day == 0))
	&& (Npc_HasItems (other,ItPo_HealObsession_MIS) == FALSE)  
		{
			if (hero.guild == GIL_KDF)
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_00"); //Исцели меня, мастер, ибо я одержим.
				
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_01"); //Да будет так! Возьми это зелье. Оно избавит тебя от ночных кошмаров.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_02"); //Да избавит тебя Иннос от этой напасти.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_03"); //Действуй от его имени и остерегайся черного взгляда врага.
				
					if (SC_ObsessionTimes > 3)
						{	
							AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_04"); //Но я предостерегаю тебя - если ты будешь попадать в их сети слишком часто, может статься так, что возврата уже не будет. Всегда помни об этом.
						};
					
					CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
					B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);					
					Got_HealObsession_Day = Wld_GetDay(); 
				}
			else
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_05"); //Я думаю, я одержим. Ты можешь исцелить меня?
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_06"); //При условии проявления твоего уважения к этому монастырю, сын мой. 300 золотых.
				
					Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "Это слишком много.", DIA_Pyrokar_SCOBSESSED_nein );
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "Отлично. Вот деньги.", DIA_Pyrokar_SCOBSESSED_ok );
				};
		 }
	 else
		 {
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_07"); //Но ты только что получил исцеляющее зелье. Обратись ко мне, только если тебе действительно понадобится помощь.
		 };
};
func void DIA_Pyrokar_SCOBSESSED_ok ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_ok_15_00"); //Отлично. Вот деньги.

	if (B_GiveInvItems (other, self, ItMi_Gold,300))
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_01"); //Вот, выпей это. Да избавит тебя Иннос от этой напасти.
			CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
			B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);
			Got_HealObsession_Day = Wld_GetDay(); 
		}
		else
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_02"); //Принеси мне деньги, и я смогу помочь тебе.
		};
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

func void DIA_Pyrokar_SCOBSESSED_nein ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_nein_15_00"); //Это слишком много.
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

///////////////////////////////////////////////////////////////////////
//	Info AlmanachBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AlmanachBringen		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Pyrokar_AlmanachBringen_Condition;
	information	 = 	DIA_Pyrokar_AlmanachBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Я могу рассказать еще кое-что об этих одержимых.";
};

func int DIA_Pyrokar_AlmanachBringen_Condition ()
{
	if (Kapitel >= 3)
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_BUCHDERBESSENEN))
		{
				return TRUE;
		};
};

var int AlmanachCounter;
var int DIA_Pyrokar_AlmanachBringen_OneTime;

func void DIA_Pyrokar_AlmanachBringen_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AlmanachBringen_15_00"); //Я могу рассказать еще кое-что об этих одержимых.
	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_01"); //Говори, брат.
	
	var int AlmanachCount;
	var int XP_KDF_BringAlmanachs;
	var int AlmanachGeld;
	var int PyrokarsAlmanachOffer;
	
	PyrokarsAlmanachOffer = 400;	//Joly: Gold fьr einen Almanach
	
	AlmanachCount = Npc_HasItems(other, ITWR_DementorObsessionBook_MIS);


	if (AlmanachCount == 1)
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_02"); //Я нашел еще один альманах.
			B_GivePlayerXP (XP_KDF_BringAlmanach);
			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,1);
			AlmanachCounter = AlmanachCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_03"); //Я нашел еще несколько книг Ищущих.

			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,  AlmanachCount);

			XP_KDF_BringAlmanachs = (AlmanachCount * XP_KDF_BringAlmanach);
			AlmanachCounter = (AlmanachCounter + AlmanachCount); 

			B_GivePlayerXP (XP_KDF_BringAlmanachs);
		};

	if (AlmanachCounter <= 5)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_04"); //Это хорошо. Боюсь, впрочем, что это далеко не все. Продолжай поиски.
		
	}
	else if	(AlmanachCounter <= 8)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_05"); //Многие из них уже найдены. Но я не думаю, что мы изъяли их все.
	}
	else
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_06"); //Ты уже принес целую кучу этих вражеских книг.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_07"); //Я буду удивлен, если тебе удастся найти еще.
	};

	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_08"); //Вот, возьми. Это дар от монастыря, который поможет тебе противостоять злу.
	if (DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_09"); //И не забывай время от времени заглядывать в мое магическое письмо.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_10"); //Возможно, они попытаются проделать это с другими, чьи имена пока еще не вписаны в альманахи.
		DIA_Pyrokar_AlmanachBringen_OneTime = TRUE; 
	};
	AlmanachGeld	= (AlmanachCount * PyrokarsAlmanachOffer);

	CreateInvItems (self, ItMi_Gold, AlmanachGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, AlmanachGeld);
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

INSTANCE DIA_Pyrokar_KAP4_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP4_EXIT_Condition;
	information	= DIA_Pyrokar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Pyrokar_KAP5_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP5_EXIT_Condition;
	information	= DIA_Pyrokar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
///////////////////////////////////////////////////////////////////////
//	Info Drachentot
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DRACHENTOT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DRACHENTOT_Condition;
	information	 = 	DIA_Pyrokar_DRACHENTOT_Info;

	description	 = 	"Все драконы мертвы.";
};

func int DIA_Pyrokar_DRACHENTOT_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DRACHENTOT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DRACHENTOT_15_00"); //Все драконы мертвы.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_01"); //Это воистину хорошие новости. Но это совершенно не меняет наше положение, которое кажется безнадежным.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_02"); //Ищущие все еще не ушли. Скорее наоборот. Я слышу все больше и больше сообщений о том, что за последние несколько дней, их численность даже увеличилась.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_03"); //Уничтожение драконов нанесло врагу серьезный удар, но этого недостаточно. Нам нужно вырвать это зло с корнем.

};

///////////////////////////////////////////////////////////////////////
//	Info DerMeister
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DERMEISTER		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DERMEISTER_Condition;
	information	 = 	DIA_Pyrokar_DERMEISTER_Info;

	description	 = 	"Я говорил с драконами.";
};

func int DIA_Pyrokar_DERMEISTER_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DERMEISTER_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_00"); //Я говорил с драконами.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_01"); //Что они сказали?
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_02"); //Они все время говорили о силе их хозяина и о том, что он находится в Чертогах Ирдората.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_03"); //Да пребудет с нами Иннос. Черный Храм восстановил свою силу и теперь отправляет своих приспешников в наш мир.

};

///////////////////////////////////////////////////////////////////////
//	Info WasIstIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WASISTIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_WASISTIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_WASISTIRDORATH_Info;

	description	 = 	"Что такое эти Чертоги Ирдората?";
};

func int DIA_Pyrokar_WASISTIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_DERMEISTER))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_WASISTIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_00"); //Что такое эти Чертоги Ирдората?
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_01"); //Восточный храм вызова бога Белиара. Всего на земле Миртаны их четыре. Но этот, вероятно, самый ужасный храм из всех.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_02"); //Около 40 лет назад северный и западный храмы этого ужасного божества были уничтожены.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_03"); //Мужественные рыцари того времени отдали все, чтобы сравнять эти величественные сооружения с землей.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_04"); //Тогда черные орды врага были бессильны против превосходящих их мужеством и числом рыцарей и паладинов.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_05"); //Было бы несложно уничтожить и оставшиеся два храма, чтобы избавить землю от зла навсегда...
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_06"); //... но после того как пал второй храм, они просто растворились.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_07"); //(насмешливо) Растворился. Целый храм. Да, точно.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_08"); //Не смейся. Ситуация серьезная. Чертоги Ирдората действительно восстановили свою силу, и теперь врага будет победить очень трудно.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_09"); //Поэтому, сначала ты должен найти этот храм, и я думаю, это будет твоя следующая и самая тяжелая задача.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_10"); //Посмотрим.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Согласно Пирокару, Чертоги Ирдората - это забытый храм вызова бога Белиара. Я должен найти этот храм."); 

};


///////////////////////////////////////////////////////////////////////
//	Info BuchIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	54;
	condition	 = 	DIA_Pyrokar_BUCHIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_BUCHIRDORATH_Info;

	description	 = 	"Книга Ксардаса, которую считали потерянной - где она?";
};

func int DIA_Pyrokar_BUCHIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (ItWr_HallsofIrdorathIsOpen  == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_WASISTIRDORATH))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_00"); //Книга Ксардаса, которую считали потерянной - где она?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_01"); //Я ожидал, что ты спросишь это. Но, боюсь, она будет бесполезной для тебя.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_02"); //Она закрыта при помощи магии. Я отнес ее в один из наших подвалов, но сколько мы не пытались открыть ее - все тщетно.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_03"); //Этот проклятый Ксардас сыграл с нами грязную шутку.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_04"); //Могу я увидеть эту книгу?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_05"); //Будь моим гостем. Но я представить себе не могу, что тебе удастся преуспеть там, где потерпели поражение величайшие маги нашего монастыря.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_06"); //Но все же ты можешь попытаться, Таламон не будет препятствовать тебе.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Книга Ксардаса 'ЧЕРТОГИ ИРДОРАТА' находится в нижних подвалах монастыря. Ее охраняет Таламон. Маги не смогли открыть эту книгу. Она закрыта на при помощи магии и они обвиняют в этом Ксардаса."); 
	
	Pyrokar_LetYouPassTalamon = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info IrdorathBookOpen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_IRDORATHBOOKOPEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Condition;
	information	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Info;

	description	 = 	"Я смог открыть книгу Ксардаса.";
};

func int DIA_Pyrokar_IRDORATHBOOKOPEN_Condition ()
{
	if (ItWr_HallsofIrdorathIsOpen == TRUE)
	&& (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_15_00"); //Я смог открыть книгу Ксардаса.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_11_01"); //Что?! Как у тебя это получилось? Это все сведет меня с ума!


	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Ксардас рассказал мне секрет.", DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas );
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Просто слепая удача, я думаю.", DIA_Pyrokar_IRDORATHBOOKOPEN_glueck );

};
func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00"); //Просто слепая удача, я думаю.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01"); //Не говори чепухи. Удача!
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02"); //Если даже я не смог открыть эту книгу, а затем приходит кто-то вроде тебя и играючи открывает ее...
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03"); //... это наводит меня на грустные размышления...
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04"); //Ладно. Так как ты, очевидно, единственный, кто смог открыть эту книгу, то я, пожалуй, позволю тебе держать ее у себя. По крайней мере, пока мы не разрешили этот кризис.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00"); //Ксардас рассказал мне секрет.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01"); //Ах, вот оно что. Как интересно. Мне остается только надеяться, что пагубное влияние Ксардаса не отравит твою душу.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02"); //Я предостерегаю тебя. Не поддавайся на уловки этого старого дьявола. Ты можешь пожалеть об этом.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

///////////////////////////////////////////////////////////////////////
//	Info GeheimeBibliothek
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GEHEIMEBIBLIOTHEK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition;
	information	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info;

	description	 = 	"В этой книге упоминается секретная библиотека.";
};

func int DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition ()
{
	if 	(ItWr_SCReadsHallsofIrdorath == TRUE)
		&& (Kapitel == 5)	
		&& (MIS_SCKnowsWayToIrdorath == FALSE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
			{
					return TRUE;
			};
};

func void DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00"); //В этой книге упоминается секретная библиотека.
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01"); //О чем это ты?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02"); //О библиотеке, находящейся под этими стенами. Тебе это ни о чем не говорит?
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03"); //Нет. Где эта библиотека должна быть, ты сказал?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04"); //Понятно. Ты ничего не знаешь о ней. Ммм.
	
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Пирокар ничего не знает о тайной библиотеке. Похоже, только Ксардас бывал в ней."); 

};

///////////////////////////////////////////////////////////////////////
//	Info SCKnowsWayToIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCKNOWSWAYTOIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info;

	description	 = 	"Я знаю, где нужно искать Чертоги Ирдората.";
};

func int DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00"); //Я знаю, где нужно искать Чертоги Ирдората.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01"); //Этот храм находится на острове. Я нашел морскую карту, которая покажет путь.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02"); //Это великолепно. Тогда тебе понадобится корабль и команда, чтобы добраться до этого врага.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03"); //Но помни, что ты должен хорошо подготовиться, если хочешь уничтожить Повелителя Ирдората.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04"); //Где мне найти команду?
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05"); //Твоя команда должна состоять из людей, которым ты можешь доверять.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06"); //Поговори со своими друзьями и подумай о том, кто может быть полезен тебе на этом острове.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07"); //Тебе там, наверняка, понадобится маг. Но, к сожалению, я не могу выделить ни одного человека из монастыря.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08"); //Тебе придется поискать мага за пределами наших стен.

};

///////////////////////////////////////////////////////////////////////
//	Info SCWillJorgen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCWILLJORGEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_SCWILLJORGEN_Condition;
	information	 = 	DIA_Pyrokar_SCWILLJORGEN_Info;

	description	 = 	"Йорген - опытный моряк.";
};

func int DIA_Pyrokar_SCWILLJORGEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jorgen_Home))
		&&(Npc_KnowsInfo(other, DIA_Pyrokar_SCKNOWSWAYTOIRDORATH))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCWILLJORGEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_00"); //Йорген - опытный моряк. Он мог бы помочь мне добраться до Острова Ирдорат.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_01"); //Боюсь, это будет не так уж просто.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_02"); //Он попросился работать в нашем монастыре. Но он не платил вступительного взноса и не привел овцы.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_03"); //Йорген должен сначала закончить свою работу, а потом ты можешь забрать его, если пожелаешь.
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_04"); //Сколько времени это займет?
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_05"); //Он в первый же день съел целую гору продуктов. Этой провизии обычному послушнику хватило бы на три недели.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_06"); //Поэтому я не могу отпустить его, пока он не отработает три месяца в наших садах.

};

///////////////////////////////////////////////////////////////////////
//	Info MachDTFrei
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MACHDTFREI		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_MACHDTFREI_Condition;
	information	 = 	DIA_Pyrokar_MACHDTFREI_Info;

	description	 = 	"А что можно сделать, чтобы я мог забрать Йоргена с собой СЕЙЧАС?";
};

func int DIA_Pyrokar_MACHDTFREI_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SCWILLJORGEN))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_MACHDTFREI_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_MACHDTFREI_15_00"); //А что можно сделать, чтобы я мог забрать Йоргена с собой СЕЙЧАС?
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_01"); //Ммм. Действительно, есть кое-что, что ты мог бы сделать для меня. Твои хорошие отношения с Ксардасом могли бы помочь тебе в этом.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_02"); //Мое внимание привлекло то, что последние несколько дней в его башне творятся странные вещи.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_03"); //Много людей слышало громкие вопли в ночи, исходящие оттуда, и видели странный свет, пляшущий над этой башней.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_04"); //Только этого нам еще не хватало. Иди, проверь что там происходит и прекрати это безобразие.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_05"); //Тогда ты сможешь забрать Йоргена.

	MIS_PyrokarClearDemonTower = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PyrokarClearDemonTower,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PyrokarClearDemonTower,LOG_RUNNING);
	B_LogEntry (TOPIC_PyrokarClearDemonTower,"Странные вещи творятся с башней Ксардаса. Если я соберусь выяснить, что там происходит, я могу взять с собой Йоргена.");
};

///////////////////////////////////////////////////////////////////////
//	Info DTCleared
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DTCLEARED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_DTCLEARED_Condition;
	information	 = 	DIA_Pyrokar_DTCLEARED_Info;

	description	 = 	"Башня Ксардаса больше никого не будет беспокоить.";
};

func int DIA_Pyrokar_DTCLEARED_Condition ()
{
	if (Npc_IsDead(Xardas_DT_Demon1)) 
	&& (Npc_IsDead(Xardas_DT_Demon2))
	&& (Npc_IsDead(Xardas_DT_Demon3))
	&& (Npc_IsDead(Xardas_DT_Demon4))
	&& (Npc_IsDead(Xardas_DT_Demon5))
	&& (Npc_IsDead(Xardas_DT_DemonLord))
	&& (MIS_PyrokarClearDemonTower == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_DTCLEARED_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DTCLEARED_15_00"); //Башня Ксардаса больше никого не будет беспокоить.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_01"); //Так что там было... нет, подожди, я не хочу даже знать.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_02"); //Если Йорген тебе все еще нужен, можешь забрать его из монастыря.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_03"); //Да хранит тебя Иннос.
	MIS_PyrokarClearDemonTower = LOG_SUCCESS;
	B_GivePlayerXP (XP_PyrokarClearDemonTower);
};

///////////////////////////////////////////////////////////////////////
//	Amulett des Todes
///////////////////////////////////////////////////////////////////////

//---------------------------------
var int Pyro_Gives_Aura;
//---------------------------------
instance DIA_Pyrokar_AmulettofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_AmulettofDeath_Condition;
	information	 = 	DIA_Pyrokar_AmulettofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"В пророчестве упоминается священная Аура Инноса.";
};

func int DIA_Pyrokar_AmulettofDeath_Condition ()
{
	if (PlayerGetsAmulettOfDeath == TRUE)
	&& (Pyro_Gives_Aura == FALSE)
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_AmulettofDeath_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AmulettofDeath_15_00"); //В пророчестве упоминается священная Аура Инноса.
	AI_Output			(self, other, "DIA_Pyrokar_AmulettofDeath_11_01"); //Аура Инноса - это амулет, который могут носить только величайшие маги всех времен и народов.
	
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,DIALOG_BACK,DIA_Pyrokar_AmulettofDeath_BAck);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"Могу я взять его?",DIA_Pyrokar_AmulettofDeath_CanHaveIt);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"Что делает этот амулет?",DIA_Pyrokar_AmulettofDeath_Amulett);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_BAck ()
{
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_CanHaveIt ()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00"); //Могу я взять его?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01"); //Что? Что ты с ним собираешься делать?
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02"); //Выступить против драконов.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03"); //Да, конечно. Я дам тебе этот амулет, но обращайся с ним бережно.
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04"); //Да, конечно.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05"); //Я не хочу, чтобы мне потом пришлось выкупать его назад у какого-нибудь торговца.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06"); //Используй его разумно, и да хранит тебя Иннос.
	
	CreateInvItems (self,ItAm_AmulettofDeath_Mis,1);
	B_GiveInvItems (self,other,ItAm_AmulettOfDeath_MIS,1);
	
	Pyro_Gives_Aura = TRUE;
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00"); //Что делает этот амулет?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01"); //Говорят, что Иннос самолично выковал его и передал человечеству.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02"); //Он защищает своего владельца от всех типов урона.
};


///////////////////////////////////////////////////////////////////////
//	Trank des Todes
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PotionofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_PotionofDeath_Condition;
	information	 = 	DIA_Pyrokar_PotionofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"Что такое Слезы Инноса?";
};

func int DIA_Pyrokar_PotionofDeath_Condition ()
{
	if (Npc_HasItems (other,ItPo_PotionOfDeath_01_MIS))
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_PotionofDeath_Info ()
{
	AI_Output		(other, self, "DIA_Pyrokar_PotionofDeath_15_00"); //Что такое Слезы Инноса?
	AI_Output		(self, other, "DIA_Pyrokar_PotionofDeath_11_01"); //Слезы Инноса - это не более чем старые детские сказки. В них говорится, как в начале времен разгорелась битва между Инносом и Белиаром.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Понимаю.",DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Я нашел это зелье.",DIA_Pyrokar_PotionofDeath_Potion);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Aha_15_00"); //Понимаю.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01"); //Я не знаю, понимаешь ли ты всю серьезность нашей ситуации, но я очень сомневаюсь, что нашего врага можно победить при помощи детских сказок.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Potion ()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_00"); //Я нашел это зелье.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01"); //Этого не может быть! Не могу поверить в это!
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_02"); //В чем дело?
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03"); //Если это действительно настоящие Слезы Инноса, то...
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_04"); //(прерывает) Вряд ли.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05"); //Не прерывай меня. Если это действительно настоящие Слезы Инноса, то мы получили грозное оружие против врага.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,Dialog_back,DIA_Pyrokar_PotionofDeath_BACK);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"Так что такое эти Слезы Инноса?",DIA_Pyrokar_PotionofDeath_Teardrops);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"Что ты имеешь в виду под 'оружием'?",DIA_Pyrokar_PotionofDeath_Weapon);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Teardrops()
{
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00"); //Так что такое эти Слезы Инноса?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01"); //Когда Иннос осознал, что ему придется сражаться с Белиаром, своим собственным братом, чтобы сохранить созданное, его печаль была велика.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02"); //Слезы потекли из глаз его и упали в наш мир. Их было много, ибо сердце его было переполнено печалью, и плакал он 13 лет.
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03"); //Ближе к делу.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04"); //Люди, нашедшие его слезы и попробовавшие их, обретали сверхъестественную силу и ясность ума. Они признавали мудрость Инноса, Создателя, и начинали служить ему.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05"); //Они стали первыми членами Братства Огня. Эти слезы давали им силу, мужество и мудрость. Но это было давным-давно, и прошло уже более 250 лет с тех пор, как последний раз видели Слезы Инноса.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath); 
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Weapon ()
{
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_00"); //Что ты имеешь в виду под оружием?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01"); //Легенда гласит, что под воздействием этой субстанции, воины Инноса могли вершить почти сверхъестественные дела.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02"); //Им была неведома усталость, и они обладали силой двух медведей.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03"); //Величайшие героические подвиги прошлых дней стали возможны только благодаря Слезам Инноса.
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_04"); //Понятно.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05"); //Но эти слезы могут также приносить страдания и смерть. Только члены нашего ордена могут пить их.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06"); //Любого другого - даже паладина нашего Владыки - ожидает мучительная смерть.

	Npc_RemoveInvItems 	(hero,ItPo_PotionOfDeath_01_Mis,1);
	CreateInvItems 		(hero,ItPo_PotionOfDeath_02_Mis,1);
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


INSTANCE DIA_Pyrokar_KAP6_EXIT(C_INFO)
{
	npc		= KDF_500_Pyrokar;
	nr		= 999;
	condition	= DIA_Pyrokar_KAP6_EXIT_Condition;
	information	= DIA_Pyrokar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pyrokar_PICKPOCKET (C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 900;
	condition	= DIA_Pyrokar_PICKPOCKET_Condition;
	information	= DIA_Pyrokar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Pyrokar_PICKPOCKET_Condition()
{
	C_Beklauen (108, 550);
};
 
FUNC VOID DIA_Pyrokar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pyrokar_PICKPOCKET);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_BACK 		,DIA_Pyrokar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pyrokar_PICKPOCKET_DoIt);
};

func void DIA_Pyrokar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};
	
func void DIA_Pyrokar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};















































































































































