voor opstarten prisma studio (schema zichtbaar op localhost 5555)
-> npx prisma studio

eerste invulling op basis van json-files
dit kan je meer keren draaien, door gebruik van combi update/add:
-> npx prisma db seed

starten met:
-> npm run dev

na wijzigingen schema db: opnieuw database maken/vullen en applicatie starten:
-> npx prisma db push --force-reset && npx prisma db seed && npm run dev

verder migreren met: npx prisma migrate reset --skip-seed
tabellen maken na migratie: npx prisma migrate dev --name init
tabellen vullen: npx prisma db seed

oplossing Winc: https://github.com/WincAcademy/express-events/tree/main/express-events-prisma-solution
