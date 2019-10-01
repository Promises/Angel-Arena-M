import datetime
import json
import os
import sys
import re

class Quest:
    def __init__(self, title, icon, stype, body):
        self.title = title
        self.icon = icon
        self.stype = stype
        self.body = body

    def __str__(self):
        return self.title

    def __repr__(self):
        return str(self)

    def asquest(self):
        q = list()
        q.append('{')

        q.append(f'   title: "%s",' % self.title)
        q.append(f'   icon: "%s",' % self.icon)
        q.append(f'   stype: %s,' % self.stype)
        q.append(f'   body: "%s",' % self.body)

        q.append('},')
        q.reverse()
        return q


def get_all_quests():
    quest_list = list()
    files = os.listdir('Quests')
    files = [file for file in files if '.md' in file]
    files = sorted(files)
    for f in files:
        with open(os.path.join('Quests', f)) as file:
            lines = file.read().splitlines()
            header = list()
            body = list()
            title = ""
            icon = "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp"
            type = "bj_QUESTTYPE_REQ_DISCOVERED"
            shouldread = False
            readbody = False
            for line in lines:
                if line.find('---') is not -1:
                    if(shouldread):
                        readbody = True
                    shouldread = True
                elif(shouldread):
                    if(readbody):
                        if len(body) > 0 or len(line) > 0:
                            body.append(line)
                    else:
                        if line.find('title:') is not -1:
                            title = re.findall("^.*'(.*)'.*$", line)[0]
                        if line.find('icon:') is not -1:
                            icon = re.findall("^.*'(.*)'.*$", line)[0]
                        if line.find('type:') is not -1:
                            intype = re.findall("^.*'(.*)'.*$", line)[0]
                            if intype is 'required':
                                type = "bj_QUESTTYPE_REQ_DISCOVERED"

                        header.append(line)

            create_quest(title, icon, type, body, [0], quest_list)

    template = list()

    with open('templates/questsGEN.ts.template') as f:
        template = f.read().splitlines()

    stripped_list = list(map(str.strip, template))
    pivot = stripped_list.index("{{GENERATE}}")
    spaces = len(template[pivot]) - len("{{GENERATE}}")
    spacer = " " * spaces

    generated_quest_list = list()

    for quest in quest_list:
        for line in quest.asquest():
            generated_quest_list.append(spacer + line)

    generated_quest_list.reverse()
    generated_library = template[0:pivot - 1]
    generated_library += generated_quest_list
    generated_library += template[pivot + 1:]

    with open('app/src/Generated/questsGEN.ts', 'w') as f:
        for item in generated_library:
            f.write("%s\n" % item)


def create_quest(title, icon, type, body, number, quest_list):
    s = '\\n'
    if len(s.join(body)) >= 1000:
        q_a, q_b = split_quest(body)
        number[0] += 1
        create_quest(title, icon, type, q_a, number, quest_list)
        number[0] += 1
        create_quest(title, icon, type, q_b, number, quest_list)
    else:
        if number[0] is not 0:
            title = title + ' - ' + str(number[0])
        quest_list.append(Quest(title, icon, type, s.join(body)))



def split_quest(quest_body):

    indices = [i for i, x in enumerate(quest_body) if x.find('Updates') != -1]
    if len(indices) >= 2:
        q_a = quest_body[indices[0]:indices[1]]
        q_b = quest_body[indices[1]:]
        return q_a, q_b
    else:
        half = int(len(quest_body) / 2)
        q_a = quest_body[0:half]
        q_b = [q_a[0]]
        q_b = q_b + quest_body[half:]
        return q_a, q_b






def get_buildnum_with_date():
    buildnum = "NaN"

    x = datetime.datetime.now()

    if len(sys.argv) > 1:
        buildnum = sys.argv[1]

    generated_list = list()
    generated_list.append(f'export const BUILD_DATE: string = "%s";' % (x.strftime("%b %d %Y")))

    generated_list.append(f'export const BUILD_NUMBER: string = "%s";' % buildnum)




    with open('app/src/Generated/Version.ts', 'w') as f:
        for item in generated_list:
            f.write("%s\n" % item)


def main():
    if not os.path.exists('app/src/Generated/'):
        os.makedirs('app/src/Generated/')

    # print(data[0]["Builds"])
    get_all_quests()

    # create_all_imports()


if __name__ == "__main__":
    main()
