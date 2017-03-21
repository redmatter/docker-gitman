FROM python:3.6

RUN ( \
    set -eux; \

    cd /tmp; \
    git clone https://github.com/jacebrowning/gitman.git; \
    cd gitman; \
    python setup.py install; \
    cd /; \
    rm -rf /tmp/gitman; \
)
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "gitman" ]
